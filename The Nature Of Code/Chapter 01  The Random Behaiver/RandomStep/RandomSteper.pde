class RandomSteper
{
  float x;
  float y;
  float stepX;
  float stepY;
  int mx;
  int my;
  RandomSteper()
  {
    x = width/2;
    y = height/2;
    mx=my=1;
    stepX = stepY =0;
  }
  
  void step()
  {
    mx = my =1;
    float randomX = random(1);
    float randomY = random(1);
    if(mouseX<x) mx*=-1;
    if(mouseY<y) my*=-1;
    stepX = LengthStep();
    stepY = LengthStep();
    if(randomX<0.6)
    {
      x+=stepX*mx;
    }else
    {
      x-=stepX*mx;
    }
    if(randomY<0.6)
    {
      y+=stepY*my;
    }else
    {
      y-=stepY*my;
    }
    
    
  }
  
  float LengthStep()
  {
    float probably = 0;
    float step = 0;
    do
    {
      probably = random(5);
      step = random(5);
    }while(step>probably*probably);
    return probably;
  }
  
  void display()
  {
    background(255);
    fill(0);
    ellipse(x,y,25,25);
  }
}