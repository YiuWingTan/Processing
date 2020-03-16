class Gun
{
 PVector location;
 PVector velocity;
 PVector acceleration;
 float mass;
 float angularVelocity;
 float angularAcceleration;
 float angle;
 
 Gun()
 {
   angle = 0;
   angularVelocity = 0;
   angularAcceleration = 0;
   mass = random(2,5);
   velocity = new PVector(cos(radians(70)),-sin(radians(70))).normalize();
   velocity.mult(24);
   acceleration = new PVector(0,0);
   location = new PVector(0+100,height-100);
 }
 
 void ApplyForce(PVector force)
 {
   PVector f = PVector.div(force,mass);
   acceleration.add(f);
 }
 
  void ApplyAngle()
  {
    float c = 0.001;
    float v = velocity.mag();
    PVector direction = velocity.get();
    direction.normalize();
    float mag = v*v*c;
    direction.mult(mag);
    direction.mult(-1);
    ApplyForce(direction);
    angularAcceleration = v/100;
  }
  
 void Update()
 {
    velocity.add(acceleration);
    location.add(velocity);
    acceleration.mult(0);
    angularVelocity+=angularAcceleration;
    angle+=angularVelocity;
 }
 
 void Display()
 {
   rectMode(CENTER);
   pushMatrix();
   translate(location.x,location.y);
   fill(150);
   strokeWeight(3);
   rotate(radians(-70)+radians(angle));
   rect(0,0,50,50);
   popMatrix();
 }
 
 boolean CheckEdge()
 {
   if(location.x>width||location.y>height)
   return true;
   return false;
 }
}