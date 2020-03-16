class CirPartical extends partical
{
  float r;
  
  CirPartical(PVector loca)
  {
    super(loca);
    r = random(3,9);
  }
  
  void display()
  {
    strokeWeight(2);
    fill(150,lifeSpan);
    ellipse(location.x,location.y,r,r);
    noFill();
  }
}