class Ball
{
  float  mass;
  PVector location;
  PVector velocity;
  PVector acceleration;
 Ball()
 {
    mass = 1;
    location = new PVector(random(15,width-15),random(15,height-15));
    velocity = new PVector(0,0);
    acceleration = new PVector(0,0);
 }
 
 void ApplyForce(PVector force)
 {
   force.div(mass);
   acceleration.add(force);
 }
 
 void Update()
 {
   velocity.add(acceleration);
   velocity.limit(15);
   location.add(velocity);
 }
 
 void Display()
 {
   fill(0);
   ellipse(location.x,location.y,30,30);
   acceleration.mult(0);
 }
 
 void CheckEdge()
 {
   if(location.x>width-15)
   {
     location.x = width-15;
     velocity.x*=-1;
   }else if(location.x<15)
   {
     location.x = 15;
     velocity.x*=-1;
   }
   
   if(location.y>height-15)
   {
     location.y = height - 15;
     velocity.y*=-1;
   }else if(location.y<15)
   {
     location.y = 15;
     velocity.y*=-1;
   }
 }
}