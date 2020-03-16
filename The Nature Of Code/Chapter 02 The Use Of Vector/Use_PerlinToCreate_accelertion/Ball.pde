class Ball
{
 PVector location;
 PVector velocity;
 PVector acceleration;
 float setOffX;
 float setOffY;
 Ball()
 {
  location = new PVector(width/2,height/2);
  velocity = new PVector(0,0);
  acceleration = new PVector(0,0);
  setOffX = 0.0;
  setOffY = 10000;
 }
 
 void update()
 {
   setOffX+=0.01;
   setOffY+=0.01;
   acceleration.x = map(noise(setOffX),0,1,-0.01,0.01);
   acceleration.y = map(noise(setOffY),0,1,-0.01,0.01);
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