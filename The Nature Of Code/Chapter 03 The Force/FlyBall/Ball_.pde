class Ball
{
  float mass;
  PVector location;
  PVector velocity;
  PVector acceleration;
  Ball()
  {
    mass = 1;
    location = new PVector(width/2,height/2);
    velocity = new PVector(0,0);
    acceleration = new PVector(0,0);
  }
  
  void ApplyForce(PVector force)
  {
    acceleration.add(force);
    acceleration.div(mass);
  }
  
  void Display()
  {
    background(255);
    fill(0);
    ellipse(location.x,location.y,30,30);
    acceleration.mult(0);
  }
  
  void Update()
  {
    velocity.add(acceleration);
    location.add(velocity);
  }
  
  void CheckEags()
  {
   if(location.y<15)
   {
     location.y = 15;
     velocity.div(-1.5);
   }
   
   if(location.x>width)
   {
     location = new PVector(width/2,height/2);
   }
  }
}