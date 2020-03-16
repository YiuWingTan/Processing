class NormalRandomer
{
  //Random generator;
  float averagerX;
  float averagerY;
  float deviation;
  float x;
  float y;
  NormalRandomer(float _deviation)
  {
    //generator = new Random();
    averagerX = width/2;
    averagerY = height/2;
    deviation = _deviation;
  }
  
  void step()
  {
    x = averagerX+deviation*randomGaussian();
    y = averagerY+deviation*randomGaussian();
  }
  
  void display()
  {
    fill(11,145,22);
    //fill(random(255),random(255),random(255));
    ellipse(x,y,5,5);
  }
}