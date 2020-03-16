 class Liquid
{
  float lc;
  float x,y,w,h;
  color c;
  
  Liquid(float _x,float _y,float _w,float _h,int _c,float _lc)
  {
    lc = _lc;
    x = _x;
    y = _y;
    w = _w;
    h = _h;
    c = _c;
  }
  
  void display()
  {
   fill(c);
   rect(x,y,w,h);
   noFill();
  }
  
  PVector CalculateForce(PVector velocity,float s)
  {
    s = s*0.1;
    float v = velocity.mag();
    float mag = v*v*lc;
    PVector force = velocity.get();
    force.normalize();
    force.mult(-1);
    force.mult(mag*s);
    return force;
  }
}