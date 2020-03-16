class Sender
{
  PVector location;
  PVector target;
  
  float sendingData;
  
  Sender(PVector _loc,PVector _tar,float date)
  {
      location = _loc.get();
      target = _tar.get();
      sendingData = date;
  }
  
  void display()
  {
    location.x = lerp(location.x,target.x,0.1);
    location.y = lerp(location.y,target.y,0.1);
    
    fill(0);
    stroke(0);
    ellipse(location.x,location.y,20,20);
    noFill();
  }
  
  float getDistance()
  {
     float distance = PVector.dist(location,target);
     return distance;
  }
  
  
}