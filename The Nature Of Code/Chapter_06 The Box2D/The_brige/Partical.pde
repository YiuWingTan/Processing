class Partical
{
  float x;
  float y;
  float w;
  float h;
  
  Body body;
  Partical(float _x,float _y,float _w,float _h)
  {
    x = _x;
    y = _y;
    w = _w;
    h = _h;
    createBody();
  }
  
  void display()
  {
    Vec2 pos = box2d.getBodyPixelCoord(body);
    float angle = body.getAngle();
    pushMatrix();
    fill(152);
    stroke(0);
    strokeWeight(4);
    translate(pos.x,pos.y);
    rotate(-angle);
    rect(0,0,w,h);
    noFill();
    popMatrix();
  }
  
  void createBody()
  {
    BodyDef bd = new BodyDef();
    bd.type = BodyType.DYNAMIC;
    bd.position = box2d.coordPixelsToWorld(x,y);
    body = box2d.createBody(bd);
    
    PolygonShape ps = new PolygonShape();
    float boxw = box2d.scalarPixelsToWorld(w/2);
    float boxh = box2d.scalarPixelsToWorld(h/2);
    ps.setAsBox(boxw,boxh);
    
    FixtureDef fd = new FixtureDef();
    fd.shape = ps;
    fd.density = 1;
    fd.friction = 0.01;
    fd.restitution = 0.3;
    
    body.createFixture(fd);
    body.setLinearVelocity(new Vec2(random(-10,10),random(5,10)));
    body.setAngularVelocity(random(5,10));
  }
  
  boolean isKill()
  {
    boolean isKill = false;
    Vec2 pos = box2d.getBodyPixelCoord(body);
    if(pos.x>width+w||pos.x<-w)
    isKill = true;
    if(pos.y>height+h||pos.y<-h)
    isKill = true;
    if(isKill)
    box2d.destroyBody(body);
    return isKill;
  }
  
  
}