class Surface
{
  Body body;
  float h;
  ArrayList<Vec2> verties;
  float setOff;
  float angleVelocity;
  float angle;
 Surface(float _h)
 {
   angleVelocity = 0.1;
   setOff = 0.1;
   h = _h;
   verties = new ArrayList<Vec2>();
   for(int x = 0;x<width;x+=5)
   {
       float y = map(sin(angle),-1,1,-20,20);
       verties.add(new Vec2(x,h+y));
       setOff+=0.01;
       angle+=angleVelocity;
   }
   createBody();
 }
 
 void display()
 {
  
  stroke(0);
  strokeWeight(4);
  beginShape();
  for(Vec2 v :verties)
  {
   vertex(v.x,v.y); 
  }
  vertex(width,height);
  vertex(0,height);
  endShape(CLOSE);
  
 }
 
 void createBody()
 {
   BodyDef bd = new BodyDef();
   bd.type = BodyType.STATIC;
   body = box2d.createBody(bd);
   
   ChainShape cs = new ChainShape();
   Vec2[] verts = new Vec2[verties.size()];
   for(int i = 0;i<verties.size();i++)
   {
     verts[i] = box2d.coordPixelsToWorld(verties.get(i));
   }
   cs.createChain(verts,verts.length);
   FixtureDef fd = new FixtureDef();
   fd.shape = cs;
   body.createFixture(fd);
 }
  
}