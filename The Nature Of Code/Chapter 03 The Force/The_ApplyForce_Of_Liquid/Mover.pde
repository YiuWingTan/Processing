class Mover
{
 PVector location;
 PVector velocity;
 PVector acceleration;
 float mass;
 Mover()
 {
   mass = random(2,5);
   float y = random(100,200);
   float x = random(mass*16/2,width-mass*16/2);
   location = new PVector(x,y);
   velocity = new PVector(0,0);
   acceleration = new PVector(0,0);
 }
 
 void checkEdge()
 {
   if(location.y>height-(mass*16)/2)
   {
     location.y = height-(mass*16)/2;
     velocity.mult(-1);
   }
   
 }
 
 void display()
 {
   fill(0);
   ellipse(location.x,location.y,mass*16,mass*16);
   noFill();
   acceleration.mult(0);
 }
 
 void ApplyForce(PVector force)
 {
   PVector f = PVector.div(force,mass);
   acceleration.add(f);
 }
 
 boolean isInside()
 {
  if(location.y>height-height/3-(mass*16)/2)
  return true;
  return false;
 }
 
 PVector drag()
 {
   float c = 0.25;
   float v = velocity.mag();
   PVector direction = velocity.get();
   direction.normalize();
   direction.mult(-1);
   direction.mult(c*v*v);
   //direction.limit(gravity.mag());
   return direction;
 }
 
 void setp()
 {
   velocity.add(acceleration);
   location.add(velocity);
 }
}