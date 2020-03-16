class RollBar
{
  RevoluteJoint joint;
  Body roll;
  Body bottom;
  float rx;
  float ry;
  float rw;
  float rh;
  
  float bx;
  float by;
  float bw;
  float bh;
  
  RollBar(float x,float y,float w,float h,float _x,float _y,float _w,float _h)
  {
    rx = x;
    ry = y;
    rw = w;
    rh = h;
    
    bx = _x;
    by = _y;
    bw = _w;
    bh =  _h;
    createBody();
    link();
  }
  
  void createBody()
  {
    BodyDef rbd = new BodyDef();
    rbd.type = BodyType.DYNAMIC;
    rbd.position.set(box2d.coordPixelsToWorld(new Vec2(rx,ry)));
    roll = box2d.createBody(rbd);
    
    BodyDef bbd = new BodyDef();
    bbd.type = BodyType.STATIC;
    bbd.position.set(box2d.coordPixelsToWorld(new Vec2(bx,by)));
    bottom = box2d.createBody(bbd);
    
    
    PolygonShape rps = new PolygonShape();
    float rboxw = box2d.scalarPixelsToWorld(rw/2);
    float rboxh = box2d.scalarPixelsToWorld(rh/2);
    rps.setAsBox(rboxw,rboxh);
    
    PolygonShape bps = new PolygonShape();
    float bboxw = box2d.scalarPixelsToWorld(bw/2);
    float bboxh = box2d.scalarPixelsToWorld(bh/2);
    bps.setAsBox(bboxw,bboxh);
    
    FixtureDef rfd = new FixtureDef();
    rfd.shape = rps;
    rfd.density = 2.0;
    rfd.friction = 0.01;
    rfd.restitution = 0.3; // Restitution is bounciness
    
    
    FixtureDef bfd = new FixtureDef();
    bfd.shape = bps;
    bfd.density = 2.0;
    bfd.friction = 0.01;
    bfd.restitution = 0.3; // Restitution is bounciness
    
    roll.createFixture(rfd);
    
    bottom.createFixture(bfd);
    
    roll.setLinearVelocity(new Vec2(random(-5,5),random(2,5)));
    roll.setAngularVelocity(random(-5,5));
  }
  
  void link()
  {
    RevoluteJointDef rjd = new RevoluteJointDef();
    rjd.initialize(roll,bottom,roll.getWorldCenter());
    rjd.enableMotor = true;
    rjd.motorSpeed = PI*2;
    rjd.maxMotorTorque =1000.0;
    
    joint = (RevoluteJoint)box2d.world.createJoint(rjd);
  }
  
  void toggleMotor()
  {
   Boolean motorstatus = joint.isMotorEnabled();
   joint.enableMotor(!motorstatus);
  }
  
  void display()
  {
    Vec2 rpos = box2d.getBodyPixelCoord(roll);
    float rangle = roll.getAngle();
    pushMatrix();
    rectMode(PConstants.CENTER);
    fill(0);
    stroke(0);
    strokeWeight(4);
    rect(bx,by,bw,bh);
    noFill();
    
    stroke(0);
    fill(0);
    strokeWeight(4);
    translate(rpos.x,rpos.y);
    rotate(-rangle);
    rect(0,0,rw,rh);
    noFill();
    popMatrix();
  }
}