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
   w =_w;
   h = _h;
   BodyDef  bd = new BodyDef();
   bd.position = box2d.coordPixelsToWorld(x,y);
   bd.type = BodyType.STATIC;
   body = box2d.createBody(bd);
   
   float box2dw = box2d.scalarPixelsToWorld(w/2);
   float box2dh = box2d.scalarPixelsToWorld(h/2);
   PolygonShape ps = new PolygonShape();
   ps.setAsBox(box2dw,box2dh);
   body.createFixture(ps,1);
 }
 
 void display()
 {
  fill(0);
  stroke(0);
  rectMode(CENTER);
  rect(x,y,w,h);
  noFill();
   
 }
  
}