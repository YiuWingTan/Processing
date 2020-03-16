class Box
{
 Body body;
 float x;
 float y;
 float w;
 float h;
 
 Box(float _w,float _h)
 {
   x = width/2;
   y = height/2;
   w = _w;
   h = _h;
   createBody();
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
   fd.friction = 0.3;
   fd.restitution = 0.5;
   body.createFixture(fd);
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
   rect(0,0,w,h);
   popMatrix();
 }
 
 boolean contains(float x, float y) {
    Vec2 worldPoint = box2d.coordPixelsToWorld(x, y);
    Fixture f = body.getFixtureList();
    boolean inside = f.testPoint(worldPoint);
    return inside;
  }
}