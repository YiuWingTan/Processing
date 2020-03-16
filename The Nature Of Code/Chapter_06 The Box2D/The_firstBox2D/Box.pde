class Box
{
   Body body;
   float w;
   float h;
   Box()
   {
      w = 16;
      h = 16;
      BodyDef bd = new BodyDef();
      bd.type = BodyType.DYNAMIC;
      Vec2 position = box2d.coordPixelsToWorld(mouseX,mouseY);
      bd.position = position;
      body = box2d.createBody(bd);
      //create the object
      
      PolygonShape ps = new PolygonShape();
      float box2dw = box2d.scalarPixelsToWorld(w/2);
      float box2dh = box2d.scalarPixelsToWorld(h/2);
      ps.setAsBox(box2dw,box2dh);
      //create the shape
      
      FixtureDef fd = new FixtureDef();
      fd.shape = ps;
      fd.friction = 0.3;
      fd.restitution = 0.5;
      fd.density = 1.0;
      body.createFixture(fd);
   }
   
   void display()
   {
     Vec2 pos = box2d.getBodyPixelCoord(body);
     float a = body.getAngle();
     
     pushMatrix();
     translate(pos.x,pos.y);
     strokeWeight(3);
     rotate(-a);
     fill(175);
     stroke(0);
     rectMode(CENTER);
     rect(0,0,w,h);
     popMatrix();
   }
   
   void killBody()
   {
     box2d.destroyBody(body);
   }
}