class Bounder
{
 
 Body body;
 float x;
 float y;
 float w;
 float h;
 
 Bounder(float _x,float _y,float _w,float _h)
 {
  x = _x;
  y = _y;
  w = _w;
  h = _h;
  createBody();
 }
 
 void createBody()
 {
   BodyDef bd = new BodyDef();
   bd.type = BodyType.STATIC;
   bd.position = box2d.coordPixelsToWorld(x,y);
   body = box2d.createBody(bd);
   
   PolygonShape ps = new PolygonShape();
   float boxw = box2d.scalarPixelsToWorld(w/2);
   float boxh = box2d.scalarPixelsToWorld(h/2);
   ps.setAsBox(boxw,boxh);
  
   body.createFixture(ps,1);
 }
 
 void display()
 {
   rectMode(CENTER);
   fill(150);
  stroke(0);
  strokeWeight(4);
  rect(x,y,w,h);
  noFill();
 }
}