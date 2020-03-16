class Target
{
  PVector location;
  
  Target()
  {
    location = new PVector(random(100,width-100),random(100,height-100));
  }
  
  void display()
  {
    noFill();
    stroke(0);
    strokeWeight(2);
    ellipse(location.x, location.y, 16, 16);
    line(location.x,location.y-16,location.x,location.y+16);
    line(location.x-16,location.y,location.x+16,location.y);
  }
}