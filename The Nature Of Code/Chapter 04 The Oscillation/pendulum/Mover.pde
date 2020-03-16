class Mover
{
  float gravity;
  float angle;
  float velocity;
  float acceleration;
  float r;
  float damping;
  PVector location;
  PVector origin;
  
 Mover(float x,float y, float _r)
 {
   location = new PVector();
   origin = new PVector(x,y);
   r =_r;
   velocity = 0;
   acceleration = 0;
   damping = 0.995;
   angle = PI/4;
   gravity = 1;
 }
 
 void Update()
 {
   acceleration = sin(angle)*(-gravity/r);
   velocity +=acceleration;
   angle+=velocity;
   velocity*=damping;
 }
 
 void Display()
 {
   strokeWeight(3);
   location.set(r*sin(angle),r*cos(angle));
   location.add(origin);
   line(origin.x,origin.y,location.x,location.y);
   fill(150);
   ellipse(location.x,location.y,50,50);
 }
 
 void Go()
 {
   Update();
   Display();
 }
}