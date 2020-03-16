class Plane
{
  float w,h; 
  float mass;
  PVector location;
  PVector velocity;
  PVector acceleration;
  Plane()
  {
    w = random(15,30);
    h = random(15,30);
    mass = random(2,5);
    location = new PVector(0,height-h);
    velocity = new PVector(0,0);
    acceleration = new PVector(0,0);
  }
  
  void ApplyForce(PVector force)
  {
    PVector f = PVector.div(force,mass);
    acceleration.add(f);
  }
  
  void setp()
  {
     velocity.add(acceleration); 
     location.add(velocity);
  }
  
  void CheckEdge()
  {
   if(location.x>width)
   {
     location = new PVector(0,height-h);
     velocity.mult(0);
   }
   
  }
  
  void Display()
  {
   fill(0);
   rect(location.x,location.y,w,h);
   noFill();
   acceleration.mult(0);
  }
  
}