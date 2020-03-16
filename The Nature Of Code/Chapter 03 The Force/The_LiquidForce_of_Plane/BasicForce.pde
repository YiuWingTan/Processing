static class BasicForce
{
  static PVector Wind;
  static PVector Gravity;
  //static PVector liquid;
  
  static PVector CalculateLiquid(PVector velocity)
  {
    float c = 0.001;
    float v = velocity.mag();
    float x = -(velocity.y/velocity.x);
    PVector force = new PVector(0,-1);
    force = force.normalize();
    force.mult(v*v*c);
    return force;
  }
  
}