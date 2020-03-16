class Obstacle
{
  PVector location;
  float w;
  float h;
  
  Obstacle(float x,float y,float _w,float _h)
  {
    location = new PVector(x,y);
    w = _w;
    h = _h;
  }
  
  void display()
  {
      fill(125);
      strokeWeight(2);
      rectMode(CORNER);
      rect(location.x,location.y,w,h);
      noFill();
  }
  
  boolean contians(PVector v)
  {
    if(v.x>location.x&&v.x<location.x+w&&v.y>location.y&&v.y<location.y+h)
     return true;
     return false;
  }
}