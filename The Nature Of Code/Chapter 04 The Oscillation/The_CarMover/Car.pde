class Car
{
  PVector location;
  PVector velocity;
  PVector acceleration;
  float mass;
  float angle;
  Car()
  {
    mass = random(2,6);
    location = new PVector(width/2,height/2);
    velocity = new PVector(0,0);
    acceleration = new PVector(0,0);
  }
  
  void Update()
  {
    velocity.add(acceleration);
    velocity.limit(5);
    location.add(velocity);
    acceleration.mult(0);
  }
  
  void ApplyForce(PVector force)
  {
    PVector f = PVector.div(force,mass);
    acceleration.add(f);
  }
  
  void Display()
  {
    fill(180);
    //stroke(0);
    pushMatrix();
    rectMode(CENTER);
    translate(location.x,location.y);
    angle = atan2(velocity.y,velocity.x);
    rotate(angle);
    triangle(0,20,0,-20,20,0);
    popMatrix();
  }
  
  
  void CheckEdge()
  {
   if(location.x>width)
   {
     location.x = 0-mass*16;
   }else if(location.x<0-mass*16)
   {
     location.x = width;
   }
   
   if(location.y>height)
   {
     location.y = 0-mass*16;
   }else if(location.y<0-mass*16)
   {
     location.y = height;
   }
    
  }
}