class Walker
{
 PVector location;
 PVector velocity;
 PVector acceleration;
 Walker()
 {
   location = new PVector(width/2,height/2);
   velocity = new PVector(0,0);
   acceleration = new PVector(0,0);
 }
 
 void update()
 {
   PVector mouse = new PVector(mouseX,mouseY);
   PVector direction = PVector.sub(mouse,location);
   float distance = direction.mag();
   float setOff = map(distance,0,width,0,0.1);
   direction.normalize();
   acceleration = PVector.mult(direction,setOff);
   velocity.add(acceleration);
   location.add(velocity);
 }
 
 void display()
 {
   background(255);
   fill(0);
   ellipse(location.x,location.y,25,25);
 }
 
}