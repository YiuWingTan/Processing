class confetti  extends particle
{
  float angle;
  float aspeed;
  confetti(float x,float y)
  {
   super(x,y);
   angle=0;
   aspeed=0.02;
  }
  void display()
  {
    angle+=aspeed;
    rectMode(CENTER);
    fill(c1);
    stroke(0);
    pushMatrix();
    translate(location.x,location.y);
    rotate(angle);
    rect(0,0,8,8);
    popMatrix();
  }
}