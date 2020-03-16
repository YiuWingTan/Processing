static class Attacker
{
  static PVector location;
  static float r;
  static void StartUp()
  {
    location = new PVector(Data.Edge.x/2,Data.Edge.y/2);
    r = 80;
  }
  
  static PVector CountForce(PVector locan)
  {
    PVector direction = PVector.sub(location,locan);
    float distance = direction.mag();
    if(distance<120)
    distance = 15;
    else
    distance = direction.mag();
    float x = 1/(distance*distance);
    PVector f = PVector.mult(direction,-x);
    return f;
  }
  
}