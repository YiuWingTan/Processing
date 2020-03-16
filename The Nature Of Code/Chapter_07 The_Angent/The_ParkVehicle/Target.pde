class Target
{
  float r;
  PVector location;
  Target(float x,float y,float _r)
  {
    location = new PVector(x,y);
    r = _r;
    
  }
  
  void display()
  {
    fill(255,0,0);
    pushMatrix();
    translate(location.x,location.y);
    ellipse(0,0,2,2);
    line(0,0,r,0);
    line(0,0,-r,0);
    line(0,0,0,r);
    line(0,0,0,-r);
    popMatrix();
    noFill();
  }
  
}