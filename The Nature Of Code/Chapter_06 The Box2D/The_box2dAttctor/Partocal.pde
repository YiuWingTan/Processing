class Partical
{
  Body body;
  float x;
  float y;
  float r;
  
  Partical(float _x,float _y,float _r)
  {
    x = _x;
    y = _y;
    r = _r;
    createBody();
  }
  
  void createBody()
  {
    BodyDef bd =new BodyDef();
    bd.type = BodyType.DYNAMIC;
    bd.position = box2d.coordPixelsToWorld(x,y);
    body = box2d.createBody(bd);
    
    CircleShape cs = new CircleShape();
    cs.m_radius = box2d.scalarPixelsToWorld(r);
    
    FixtureDef fd = new FixtureDef();
    fd.density = 1;
    fd.friction = 0.3;
    fd.restitution = 0.3;
    fd.shape = cs;
    body.createFixture(fd);
  }
  
  void  display()
  {
    Vec2 pos = box2d.getBodyPixelCoord(body);
    float angle = body.getAngle();
    
    pushMatrix();
    stroke(0);
    strokeWeight(4);
    translate(pos.x,pos.y);
    rotate(-angle);
    ellipse(0,0,r*2,r*2);
    line(0,0,-r,0);
    popMatrix();
  }
  
  void applyForce(Vec2 force)
  {
    Vec2 center = body.getWorldCenter();
    body.applyForce(force,center);
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
}