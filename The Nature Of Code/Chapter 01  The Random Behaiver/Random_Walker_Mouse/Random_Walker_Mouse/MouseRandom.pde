class MouseRandom
{
  float x;
  float y;
  
  MouseRandom()
  {
    x = width/2;
    y = height/2;
  }
   
  void step()
  {
    float randomX = random(1);
    float randomY = random(1);
    int xsetoff = 2;
    int ysetoff = 2;
    if(x>mouseX) xsetoff*=-1;
    if(y>mouseY) ysetoff*=-1;
    if(randomX<0.6)
    {
      x+=xsetoff;
    }else
    {
      x-=xsetoff;
    }
    
    if(randomY<0.6)
    {
      y+=ysetoff;
    }else
    {
      y-=ysetoff;
    }
   }

  void display()
  {
    background(255);
    fill(0);
    ellipse(x,y,20,20);
  }
}