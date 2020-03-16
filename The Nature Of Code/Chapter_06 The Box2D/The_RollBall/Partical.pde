class Partical
{
  Body body;
  float x;
  float y;
  float r;
  
  Partical(float _x,float _y)
  {
    x = _x;
    y = _y;
    r = random(8,15);
    createBody();
  }
  
  void createBody()
  {
    BodyDef bd = new BodyDef();
    bd.type = BodyType.DYNAMIC;
    bd.position = box2d.coordPixelsToWorld(x,y);
    body = box2d.createBody(bd);
    
    CircleShape cs = new CircleShape();
    cs.m_radius = box2d.scalarPixelsToWorld(r);
    FixtureDef fd = new FixtureDef();
    fd.shape = cs;
    fd.density = 3.0;
    fd.friction = 0.01;
    fd.restitution = 0.3;
    body.createFixture(fd);
    
    body.setLinearVelocity(new Vec2(random(-10,10),random(8,15)));
    body.setAngularVelocity(random(5,10));
  }
  
  boolean isKill()
  {
   Vec2 pos = box2d.getBodyPixelCoord(body);
    boolean isKill = false;
    if(pos.x>width+r||pos.x<-r)
    {
     isKill = true;
    }
    if(pos.y>height+r||pos.y<-r)
    {
      isKill = true;
    }
    if(isKill)
    box2d.destroyBody(body);
    return isKill;
  }
  
  void display()
  {
    Vec2 pos = box2d.getBodyPixelCoord(body);
    float angle = body.getAngle();
    
    pushMatrix();
    stroke(0);
    strokeWeight(4);
    translate(pos.x,pos.y);
    rotate(-angle);
    line(0,0,-r,0);
    ellipse(0,0,r*2,r*2);
    popMatrix();
  }
}