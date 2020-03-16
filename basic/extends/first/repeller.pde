class repeller
{
  PVector location;
  float r;
  PVector plocation;
  color c1=175;
  repeller()
  {
    location=new PVector(width/2,height/2);
    r=100;
  }
  void  display()
  {
    fill(c1);
    ellipse(location.x,location.y,r,r);
  }
  void drag()
  {
    location.x=mouseX+plocation.x;
    location.y=mouseY+plocation.y;
  }
}