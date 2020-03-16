class GaussianRandomer
{
  float x;
  float y;
  float deviation;
  GaussianRandomer(float _deviation)
  {
    x = width/2;
    y = height/2;
    deviation = _deviation;
  }
  
  void step()
  {
    float randomX = random(1);
    float randomY = random(1);
    if(randomX<0.5)
    {
      x+=deviation*randomGaussian();
    }else
    {
      x-=deviation*randomGaussian();
    }
    
    if(randomY<0.5)
    {
      y+=deviation*randomGaussian();
    }else
    {
      y-=deviation*randomGaussian();
    }
  }
  
  void display()
  {
    background(255);
    fill(0);
    ellipse(x,y,15,15);
    
  }
}