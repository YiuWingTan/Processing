class noiseSurface
{
  ArrayList<Vec2> noiseSurface;
  Body body;
  float setOff;
  noiseSurface()
  {
    setOff = 0.01;
    noiseSurface = new ArrayList<Vec2>(); 
    createBody();
  }
  
  
  void display()
  {
    //fill(0);
    strokeWeight(5);
    stroke(0);
    beginShape();
    for(Vec2 v:noiseSurface)
    {
     vertex(v.x,v.y); 
    }
    vertex(width,height);
    vertex(0,height);
    endShape(CLOSE);
    //noFill();
  }
  
  void createBody()
  {
    BodyDef bd = new BodyDef();
    bd.type = BodyType.STATIC;
    body = box2d.createBody(bd);
    for(int i =0;i<width;i+=5)
    {
      float y = map(noise(setOff),0,1,400,height);
     noiseSurface.add(new Vec2(i,y)); 
     setOff+=0.02;
    }
    Vec2 []vetrices = new Vec2[noiseSurface.size()];
    for(int i =0;i<vetrices.length;i++)
    {
     vetrices[i] = box2d.coordPixelsToWorld(noiseSurface.get(i));
    }
    ChainShape cs = new ChainShape();
    cs.createChain(vetrices,vetrices.length);
    body.createFixture(cs,1);
  }
}