class Bob
{
  PVector location;
  PVector velocity;
  PVector acceleration;
  float mass;
  
  Bob()
  {
    location = new PVector(width/2,300);
    velocity = new PVector(0,0);
    acceleration = new PVector(0,0);
    mass = random(2,4);
  }
  
  void ApplyForce(PVector force)
  {
    //PVector f = PVector.div(force,mass);
    acceleration.add(force);
  }
  
  void Update()
  {
    velocity.add(acceleration);
    location.add(velocity);
    acceleration.mult(0);
  }
  
  void Display()
  {
    strokeWeight(3);
    fill(25,123,232);
    ellipse(location.x,location.y,mass*18,mass*18);
    //print(location.x,location.y,"\n");
  }
  
  
}