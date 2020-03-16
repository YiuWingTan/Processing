class Mover
{
  PVector location;
  float angle;
  float angularVelocity;
  float velocity;
  float amplitude;
  Mover()
  {
    location = new PVector(0,height/2);
    angle = 0;
    amplitude = 150;
    velocity = 1;
    angularVelocity = 0.05;
  }
  
  void Update()
  {
    location.x+=velocity;
    location.y = amplitude*sin(angle)+height/2;
    angle+=angularVelocity;
  }
  
  void Display()
  {
    strokeWeight(3);
    ellipse(location.x,location.y,60,60);
  }
}