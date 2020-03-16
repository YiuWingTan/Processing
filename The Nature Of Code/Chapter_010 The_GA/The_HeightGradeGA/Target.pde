class Target
{
  PVector location;
  float r;
  
  Target(float x,float y,float _r)
  {
    location = new PVector(x,y);
    r = _r;
  }
  
  void display()
  {
    fill(150);
    
    ellipse(location.x,location.y,r,r);
    noFill();
  }
  
  boolean contains(PVector v)
  {
    float distnace = PVector.dist(v,location);
    if(distnace<r) return true;
    return false;
  }
  
  void setTarget(PVector _location)
  {
    location = _location.get();
  }
}