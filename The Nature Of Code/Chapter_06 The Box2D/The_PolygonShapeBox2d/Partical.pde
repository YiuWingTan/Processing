class Partical
{
  Body body;
  float x;
  float y;
  Partical(float _x,float _y)
  {
    x = _x;
    y = _y;
    createBody();
  }
  
  void display()
  {
    Vec2 pos = box2d.getBodyPixelCoord(body);
    float angle = body.getAngle();
    
    Fixture f = body.getFixtureList();
    PolygonShape ps = (PolygonShape)f.getShape();
    rectMode(CENTER);
    pushMatrix();
    translate(pos.x,pos.y);
    rotate(-angle);
    fill(175);
    strokeWeight(3);
    stroke(0);
    beginShape();
    for(int i = 0;i<ps.getVertexCount();i++)
    {
       Vec2 v = box2d.vectorWorldToPixels(ps.getVertex(i)); 
       vertex(v.x,v.y);
    }
    endShape(CLOSE);
    popMatrix();
  }
  
  void createBody()
  {
    BodyDef bd =new BodyDef();
    bd.position = box2d.coordPixelsToWorld(x,y);
    bd.type = BodyType.DYNAMIC;
    body = box2d.createBody(bd);
    
    PolygonShape ps = new PolygonShape();
    Vec2 []shape = new Vec2[6];
    shape[0] = box2d.vectorPixelsToWorld(new Vec2(-5,-5));
    shape[1] = box2d.vectorPixelsToWorld(new Vec2(0,-10));
    shape[2] = box2d.vectorPixelsToWorld(new Vec2(5,-5));
    shape[3] = box2d.vectorPixelsToWorld(new Vec2(5,5));
    shape[4] = box2d.vectorPixelsToWorld(new Vec2(0,10));
    shape[5] = box2d.vectorPixelsToWorld(new Vec2(-5,5));
    ps.set(shape,shape.length);
    
    FixtureDef fd = new FixtureDef();
    fd.shape = ps;
    fd.density = 1;
    fd.friction = 0.01;
    fd.restitution = 0.3;
    body.createFixture(fd);
    
    body.setLinearVelocity(new Vec2(random(-10f,10f),random(5,10)));
    body.setAngularVelocity(random(-10,10));
  }
  
  boolean isKill()
  {
    boolean isKill = false;
    Vec2 pos = box2d.getBodyPixelCoord(body);
    if(pos.x>width+20||pos.x<-20)
    isKill = true;
    if(pos.y>height+20||pos.y<-20)
    isKill = true;
    if(isKill)
    {
      box2d.destroyBody(body);
      
    }
    return isKill;
  }
}