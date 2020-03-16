class Box
{
  
  PVector location;
  PVector velocity;
  PVector acceleration;
  PVector f;
  PVector point1;
  PVector point2;
  float gravity;
  float mass;
  float w,h;
  float angle;
  Box(float _angle)
  {
    w = 50;
    h = 40;
    point1 = new PVector(0,height/2);
    point2 = new PVector(width/2,height);
    acceleration = new PVector();
    location = new PVector(0,height/2-(h*1.2));
    velocity = new PVector();
    mass = 2;
    gravity = 0.2;
    angle = _angle;
  }
  
  void Calculate()
  {
    PVector direction = PVector.sub(point2,point1).normalize();
    float N = gravity*cos(angle);
    float G = gravity*sin(angle);
    direction.mult(G-N);
    acceleration = PVector.div(direction,1);
    print(acceleration.x,acceleration.y,"\n");
  }
  
  void Update()
  {
    velocity.add(acceleration);
    location.add(velocity);
  }
  
  void Display()
  {
    strokeWeight(3);
    line(point1.x,point1.y,point2.x,point2.y);
    pushMatrix();
    translate(location.x,location.y);
    rotate(PI/6.5);
    rect(0,0,w,h);
    popMatrix();
  }
  
}