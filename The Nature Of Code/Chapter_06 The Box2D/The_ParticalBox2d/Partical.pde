class Partical
{
  float r;
  float x;
  float y;
  Body body;
  Partical(float _x,float _y)
  {
   r = random(2,6);
   x = _x;
   y = _y;
   createObject();
  }
  
  boolean isKillObject()
  {
    boolean isKill = false;
    Vec2 pos = box2d.getBodyPixelCoord(body);
    if(pos.x>width+r||pos.x<-r)
    isKill = true;
    if(pos.y>height+r||pos.y<-r)
    isKill = true;
    if(isKill)
    {
      box2d.destroyBody(body);
      return true;
    }
    return false;
  }
  
  void display()
  {
      Vec2 pos = box2d.getBodyPixelCoord(body);
      float a = body.getAngle();
      pushMatrix();
      translate(pos.x,pos.y);
      rotate(-a);
      fill(127);
      stroke(0);
      strokeWeight(2);
      ellipse(0,0,r*2,r*2);
      line(0,0,r,0);
      popMatrix();
      noFill();
  }
  
  void createObject()
  {
   BodyDef bd = new BodyDef();
   bd.position = box2d.coordPixelsToWorld(x,y);
   bd.type = BodyType.DYNAMIC;
   body = box2d.createBody(bd);
   CircleShape cs = new  CircleShape();
   cs.m_radius = box2d.scalarPixelsToWorld(r);
   FixtureDef fd = new FixtureDef();
   fd.shape = cs;
   fd.density = 1;
   fd.friction = 0.01;
   fd.restitution = 0.3;
   body.createFixture(fd);
   body.setLinearVelocity(new Vec2(random(-10f,10f),random(5f,10f)));
   body.setAngularVelocity(random(-10,10));
  }
}