class Target
{
  Vehicle vehicle;
  PVector location;
  PVector point;
  float distance;
  float r;
  float n ;
  Target(float _r,float _distance)
  {
    n = 0;
    location = new PVector();
    point = new PVector();
    r =_r;
    distance = _distance;
  }
  
  void chooseDirection()
  {
    PVector vehiclePosition = vehicle.location.get();
    PVector vehicleDirection = vehicle.velocity.get();
    vehicleDirection.normalize();
    vehicleDirection.mult(distance);
    vehiclePosition.add(vehicleDirection);
    location = vehiclePosition.get();
    //choose the circle position
    
    float angle = map(noise(n),0,1,-PI*2,PI*2);
    float setOffX = r*cos(angle);
    float setOffY = r*sin(angle);
    PVector setOff = new PVector(setOffX,setOffY);
    point = PVector.add(location,setOff);
    n+=0.01;
  }
  
  void display()
  {
    fill(250);
    stroke(0);
    strokeWeight(2);
    ellipse(location.x,location.y,r*2,r*2);
    strokeWeight(2);
    point(point.x,point.y);
    strokeWeight(8);
    point(location.x,location.y);
    strokeWeight(1);
    line(location.x,location.y,point.x,point.y);
    line(location.x,location.y,vehicle.location.x,vehicle.location.y);
    noFill();
  }
  
  void setTarget(Vehicle _vehicle)
  {
    vehicle = _vehicle;
  }
  
  void move()
  {
    chooseDirection();
    display();
  }
}