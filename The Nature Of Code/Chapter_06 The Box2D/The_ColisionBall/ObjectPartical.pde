class ObjectPartical
{
  Body body;
  float x;
  float y;
  float r;
  color col;
  boolean isDead;
  ObjectPartical(float _x,float _y,float _r)
  {
    x = _x;
    y = _y;
    r = _r;
    col = color(175);
    isDead = false;
  }
  
  
  
  
  void display()
  {
    Vec2 pos = box2d.getBodyPixelCoord(body);
    float angle = body.getAngle();
    
    pushMatrix();
    stroke(0);
    strokeWeight(2);
    translate(pos.x,pos.y);
    rotate(-angle);
    fill(col);
    ellipse(0,0,r*2,r*2);
    line(0,0,-r,0);
    popMatrix();
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
    fd.density = 2;
    fd.friction = 0.8;
    fd.restitution = 0.2;
    body.createFixture(fd);
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
    if(isKill||isDead)
    {
      box2d.destroyBody(body);
      return true;
    }
    return false;
  }
}