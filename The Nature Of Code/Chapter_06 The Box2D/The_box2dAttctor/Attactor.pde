class Attactor
{
  Body body;
  float x;
  float y;
  float r;
  float G;
  
 Attactor(float _x,float _y,float _r)
 {
   x = _x;
   y = _y;
   r = _r;
   G = 98;
   createBody();
 }
 
 void createBody()
 {
   BodyDef bd = new BodyDef();
   bd.type = BodyType.STATIC;
   bd.position = box2d.coordPixelsToWorld(x,y);
   body = box2d.createBody(bd);
   
   CircleShape cs = new CircleShape();
   cs.m_radius = box2d.scalarPixelsToWorld(r);
   
   FixtureDef fd = new FixtureDef();
   fd.shape = cs;
   fd.density = 2;
   fd.friction = 0.3;
   body.createFixture(fd);
   
 }
 
 void display()
 {
   fill(150);
   stroke(0);
   strokeWeight(4);
   ellipse(x,y,r*2,r*2);
   noFill();
 }
 
 Vec2 attract(Partical node)
 {
   Vec2 moverpos = node.body.getWorldCenter();
   Vec2 pos = body.getWorldCenter();
   Vec2 force = pos.sub(moverpos);
   float distance = constrain(force.length(),1,5);
   float strength = (G*10*node.body.m_mass)/(distance*distance);
   force.normalize();
   force.mulLocal(strength);
   return force;
 }
 
 
}