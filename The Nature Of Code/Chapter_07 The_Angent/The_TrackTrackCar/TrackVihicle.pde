class TrackVehicle
{
  Vehicle target;
  
 PVector location;
 PVector velocity;
 PVector acceleration;
 
 float r;
 float maxSpeed;
 float maxForce;
 float angle ;
 
 TrackVehicle(Vehicle _target,float _r,float _maxSpeed,float _maxForce)
 {
   target = _target;
   maxSpeed = _maxSpeed;
   maxForce = _maxForce;
   r = _r;
   angle = 0;
   location = new PVector(random(0,width),random(0,height));
   velocity = new PVector(random(-10,10),random(-10,10));
   acceleration = new PVector();
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
 
 void update()
 {
   velocity.add(acceleration);
    location.add(velocity);
    acceleration.mult(0);
 }
 
 void seek()
 {
   PVector targetLocation = PVector.add(target.location,target.velocity);
   PVector desired = PVector.sub(targetLocation,location);
   desired.normalize();
   desired.mult(maxSpeed);
   
   PVector turnForce = PVector.sub(desired,velocity);
   turnForce.limit(maxForce);
   applyForce(turnForce);
 }
 
 void applyForce(PVector force)
 {
   PVector f = force.get();
    acceleration.add(f);
 }
 
 void move()
 {
    seek();
    update();
    display();
    isOutSide();
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
 
}