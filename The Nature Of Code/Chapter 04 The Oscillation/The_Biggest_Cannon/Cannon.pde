class Cannon
{
  PVector location;
  float angle;
  Cannon()
  {
   location = new PVector(0+100,height-100);
   angle = radians(-70);
  }
  
  void Display()
  {
   fill(100);
   rectMode(CENTER);
   pushMatrix();
   translate(location.x,location.y);
   rotate(angle);
   strokeWeight(3);
   rect(0,0,100,50);
   popMatrix();
  }
}