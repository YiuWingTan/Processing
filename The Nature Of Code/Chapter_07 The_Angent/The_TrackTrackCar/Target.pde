class Target
{
  Vehicle target;
  TrackVehicle trackVehicle;
 PVector velocity;
 PVector acceleration;
 PVector location;
 float r;
 float angle;
 float maxSpeed;
 float maxForce;
 
 Target(float _r,float _maxSpeed,float _maxForce)
 {
   r = _r;
   maxSpeed = _maxSpeed;
   maxForce = _maxForce;
   velocity = new PVector(random(-20,20),random(-20,20));
   acceleration = new PVector();
   location = new PVector(width/2,height/2);
 }
 
 void applyForce(PVector force)
 {
    PVector f = force;
    acceleration.add(f);
 }
 
 void update()
 {
   velocity.add(acceleration);
   //velocity.limit(7);
   location.add(velocity);
   acceleration.mult(0);
 }
 
 void hide()
 {
   PVector desired = PVector.sub(location,target.location);
   desired.normalize();
   desired.mult(maxSpeed);
   
   PVector turnForce = PVector.sub(desired,velocity);
   turnForce.limit(0.2);
   applyForce(turnForce);
   //println(turnForce.x,turnForce.y);
 }
 
 void seek()
 {
   PVector desired = PVector.sub(trackVehicle.location,location);
   desired.normalize();
   desired.mult(maxSpeed);
   
   PVector turnForce = PVector.sub(desired,velocity);
   turnForce.limit(maxForce);
   applyForce(turnForce);
   //println(turnForce.x,turnForce.y);
 }
 
 void isOutSide()
 {
   if(location.x<-50||location.x>width+50)
    {
      velocity.x = -velocity.x;
    }
     
     if(location.y<-50||location.y>height+50)
     {
       velocity.y = -velocity.y;
     }
 }
 
 void display()
 {
   angle = velocity.heading2D()+PI/2;
    fill(0);
    pushMatrix();
    translate(location.x,location.y);
    rotate(angle);
    beginShape();
    vertex(0,-r*2);
    vertex(-r,r*2);
    vertex(r,r*2);
    endShape(CLOSE);
    popMatrix();
    noFill();
 }
 void setTarget(Vehicle _target,TrackVehicle track)
 {
   target = _target;
   trackVehicle = track;
 }
 
 void move()
 {
   hide();
   seek();
   update();
   display();
   isOutSide();
 }
}