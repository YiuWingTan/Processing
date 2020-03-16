class Partical
{
  float x;
  float y;
  float r;
  float w;
  float h;
  Body body;
  ArrayList<Vec2> shape;
 Partical(float _x,float _y)
 {
   x = _x;
   y = _y;
   shape = new ArrayList<Vec2>();
   w = 10;
   h = 20;
   r = 8;
   createBody();
 }
 
 void createBody()
 {
   BodyDef bd = new BodyDef();
   bd.type = BodyType.DYNAMIC;
   bd.position = box2d.coordPixelsToWorld(x,y);
   body = box2d.createBody(bd);
   FixtureDef[] fd = new FixtureDef[2];
   fd[0] = new FixtureDef();
   fd[1] = new FixtureDef();
   CircleShape cs = new CircleShape();
   cs.m_radius = box2d.scalarPixelsToWorld(r);
   Vec2 setOff = new Vec2(0,-h/2);
   setOff = box2d.vectorPixelsToWorld(setOff);
   cs.m_p.set(setOff.x,setOff.y);
   fd[0].shape = cs;
   fd[0].density = 1;
   fd[0].friction = 0.01;
   fd[0].restitution = 0.3;
   PolygonShape ps = new PolygonShape();
   float box2dw = box2d.scalarPixelsToWorld(w/2);
   float box2dh = box2d.scalarPixelsToWorld(h/2);
   ps.setAsBox(box2dw,box2dh);
   fd[1].shape = ps;
   fd[0].density = 1;
   fd[0].friction = 0.01;
   fd[0].restitution = 0.3;
   for(int i=0;i<2;i++)
   body.createFixture(fd[i]);
   body.setLinearVelocity(new Vec2(random(-10f,10f),random(5,10)));
   body.setAngularVelocity(random(-10,10));
 }
 
 
 void display()
 {
   Vec2 pos = box2d.getBodyPixelCoord(body);
   float angle = body.getAngle();
   pushMatrix();
   strokeWeight(4);
   translate(pos.x,pos.y);
   rotate(-angle);
   fill(175);
   stroke(0);
   rect(0,0,w,h);
   ellipse(0,-h/2,r*2,r*2);
   popMatrix();
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
 