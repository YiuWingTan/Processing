class Mover
{
  PVector location;
  PVector velocity;
  PVector acceleration;
  float w,h;
  float mass;
  Mover()
  {
   location = new PVector(random(0,width),random(150,200)); 
   velocity = new PVector(0,0);
   acceleration = new PVector(0,0);
   w = random(15,30);
   h = random(15,30);
   mass = random(2,8);
  }
  
  void ApplyForce(PVector force)
  {
    PVector f = PVector.div(force,mass);
    acceleration.add(f);
  }
  
  void Setp()
  {
    velocity.add(acceleration);
    location.add(velocity);
  }
  
  void CheckEdge()
  {
    if(location.y>height - h)
    {
       location.y = height - h;
       velocity.mult(-0.5);
    }
  }
  
  boolean isInside(Liquid liquid)
  {
    if(location.y>liquid.y-h)
    {
      return true;
    }
    return false;
  }
  
  void Display()
  {
   smooth();
   fill(0);
   rect(location.x,location.y,w,h);
   noFill();
   noSmooth();
   acceleration.mult(0);
  }
}