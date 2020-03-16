class food
{
  PVector location;
  float r=40;
  food()
  {
    location=new PVector(random(100,width),random(100,height));
  }
  void display()
  {
    fill(145,22,69);
    ellipse(location.x,location.y,r,r);
    noFill();
  }
  
}