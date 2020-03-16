class SinSurface
{
  Body body;
  ArrayList<Vec2>sinSurface;
  float angle;
  float angleVelocity;
  float origin;
  
  SinSurface()
  {
    origin = 500;
    angle = 0;
    angleVelocity = 0.1;
    sinSurface = new ArrayList<Vec2>();
    createObject();
  }
  
  void display()
  {
    //fill(255);
    strokeWeight(2);
    //stroke(0);
    beginShape();
    for(Vec2 v:sinSurface)
    {
      vertex(v.x,v.y);
    }
    endShape();
    //noFill();
  }
  
  void createObject()
  {
    BodyDef bd = new BodyDef();
    bd.type = BodyType.STATIC;
    body = box2d.createBody(bd);
    for(int i=0;i<width;i+=5)
    {
       float offSet = map(sin(angle),-1,1,-200,200);
       sinSurface.add(new Vec2(i,origin+offSet));
       angle+=angleVelocity;
    }
    Vec2 []vetrices = new Vec2[sinSurface.size()];
    for(int i =0;i<vetrices.length;i++)
    {
      vetrices[i] = box2d.coordPixelsToWorld(sinSurface.get(i));
    }
    ChainShape cs = new ChainShape();
    cs.createChain(vetrices,vetrices.length);
    body.createFixture(cs,1);
  }
}