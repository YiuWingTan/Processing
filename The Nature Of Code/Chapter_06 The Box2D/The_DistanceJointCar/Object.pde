class Object
{
 Body body;
 float x;
 float y;
 float w;
 float h;
 float r;
 boolean showMode;
 
 Object(float _x,float _y,float _r,boolean _showMode)
 {
   x = _x;
   y = _y;
   r = _r;
   showMode = _showMode;
   createBody();
 }
 
 Object(float _x,float _y,float _w,float _h,boolean _showMode)
 {
   x = _x;
   y = _y;
   w = _w;
   h = _h;
   showMode = _showMode;
   createBody();
 }
 
 void createBody()
 {
   BodyDef bd = new BodyDef();
   bd.type = BodyType.DYNAMIC;
   bd.position = box2d.coordPixelsToWorld(x,y);
   body = box2d.createBody(bd);
   
   PolygonShape ps = new PolygonShape();
   CircleShape cs = new CircleShape();
   FixtureDef fd = new FixtureDef();
   if(showMode)
   {
     float boxw = box2d.scalarPixelsToWorld(w/2);
     float boxh = box2d.scalarPixelsToWorld(h/2);
     ps.setAsBox(boxw,boxh);
     fd.shape = ps;
     fd.density = 1;
     fd.friction = 0.1;
     fd.restitution = 0.5;

     body.createFixture(fd);
     body.setLinearVelocity(new Vec2(0,0));
     body.setAngularVelocity(0);
   }else
   {
     cs.m_radius = box2d.scalarPixelsToWorld(r);
     fd.shape = cs;
     // Parameters that affect physics
     fd.density = 1;
     fd.friction = 0.6;
     fd.restitution = 0.2;
     body.createFixture(fd);

     // Give it a random initial velocity (and angular velocity)
     body.setLinearVelocity(new Vec2(random(-10f,10f),random(5f,10f)));
     body.setAngularVelocity(random(-10,10));
   }
 }
 
 void display()
 {
   Vec2 pos = box2d.getBodyPixelCoord(body);
   float angle = body.getAngle();
   
   if(showMode)
   rectMode(PConstants.CENTER);
   pushMatrix();
   stroke(0);
   strokeWeight(4);
   translate(pos.x,pos.y);
   rotate(-angle);
   if(showMode)
   rect(0,0,w,h);
   else
   {
    ellipse(0,0,r*2,r*2);
    line(0,0,-r,0);
   }
   popMatrix();
   
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