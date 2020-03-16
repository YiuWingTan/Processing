class Ball
{
  
  float x;
  float y;
  float r;
  boolean isFix;
  
 Body body;
 
 Ball(float _x,float _y,boolean _isFix)
 {
   r = 5;
   x = _x;
   y = _y;
   isFix  = _isFix;
   createBody();
 }
 
 void display()
 {
   Vec2 pos = box2d.getBodyPixelCoord(body);
   float angle = body.getAngle();
   pushMatrix();
   stroke(0);
   strokeWeight(3);
   translate(pos.x,pos.y);
   line(0,0,0,r);
   rotate(-angle);
   ellipse(0,0,r*2,r*2);
   popMatrix();
 }
 
 void createBody()
 {
   BodyDef bd = new BodyDef();
   bd.position = box2d.coordPixelsToWorld(x,y);
   if(!isFix)
   bd.type = BodyType.DYNAMIC;
   else
   bd.type = BodyType.STATIC;
   body = box2d.createBody(bd);
   
   CircleShape cs = new CircleShape();
   cs.m_radius = box2d.scalarPixelsToWorld(r);
   
   FixtureDef fd = new FixtureDef();
   fd.shape = cs;
   fd.density = 1;
   fd.friction = 0.02;
   fd.restitution = 0.5;
   
   body.createFixture(fd);
 }
}