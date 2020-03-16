class Surface
{
  float x;
  float y;
  float w;
  float h;
  Body body;
  Surface(float _x,float _y,float _w,float _h)
  {
    x = _x;
    y =_y;
    w = _w;
    h = _h;
    createBody();
  }
  
  void display()
  {
    rectMode(CENTER);
    stroke(0);
    fill(0);
    rect(x,y,w,h);
    noFill();
  }
  
  void createBody()
  {
    BodyDef bd = new BodyDef();
    bd.type = BodyType.STATIC;
    Vec2 pos = box2d.coordPixelsToWorld(x,y);
    bd.position = pos;
    body = box2d.createBody(bd);
    
    PolygonShape ps = new PolygonShape();
    float box2dw = box2d.scalarPixelsToWorld(w/2);
    float box2dh = box2d.scalarPixelsToWorld(h/2);
    ps.setAsBox(box2dw,box2dh);
    
    FixtureDef fd = new FixtureDef();
    fd.shape = ps;
    body.createFixture(fd);
  }
}