class Bob
{
  float gravity;
  float damping;
  float lenght;
  float angle;
  float angularVelocity;
  float acceleration;
  PVector location;
  PVector origin;
  Bob(float x,float y,float _angle,float r)
  {
    origin = new PVector(x,y);
    angle = _angle;
    lenght = r;
    location = new PVector();
    damping = 0.99;
    gravity = 0.4;
  }
  
  void Update()
  {
    acceleration = sin(angle)*(-gravity/lenght);
    angularVelocity+=acceleration;
    angle += angularVelocity;
    angularVelocity*=damping;
  }
  
  void Display()
  {
    location.set(lenght*sin(angle),lenght*cos(angle));
    location.add(origin);
    strokeWeight(3);
    line(origin.x,origin.y,location.x,location.y);
    fill(25,123,211);
    ellipse(location.x,location.y,60,60);
  }
}