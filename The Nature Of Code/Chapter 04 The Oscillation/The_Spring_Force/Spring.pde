class Spring
{
  float k;
  float len;
  PVector anchor;
  
  Spring(float x,float y,float l)
  {
    anchor = new PVector(x,y);
    len = l;
    k = 0.02;
  }
  
  void Connect(Bob b)
  {
    PVector force = PVector.sub(b.location,anchor);
    float distance = force.mag();
    float x = distance - len;
    force.normalize();
    force.mult(k*x*-1);
    b.ApplyForce(force);
  }
  
  void Display(Bob b)
  {
    line(anchor.x,anchor.y,b.location.x,b.location.y);
  }
  
}