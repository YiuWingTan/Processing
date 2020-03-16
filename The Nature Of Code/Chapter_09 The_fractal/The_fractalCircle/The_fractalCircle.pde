
void setup()
{
  
  size(2000,1000);
  smooth();
  background(255);
  fractalCircle(1000,width/2,height/2);
}

void draw()
{
  
}

void fractalCircle(float r,float x,float y)
{
    stroke(0);
    noFill();
    ellipse(x,y,r,r);
    if(r>=10)
    {
      fractalCircle(r/2,x-r/2,y);
      fractalCircle(r/2,x+r/2,y);
      fractalCircle(r/2,x,y+r/2);
      fractalCircle(r/2,x,y-r/2);
    }
}

/*void drawCircle(float x,float y,float r)
{
  stroke(0);
  noFill();
  ellipse(x,y,r,r);
  if(r>2)
  {
    drawCircle(x+r,y,r/2);
    drawCircle(x-r,y,r/2);
  }
}

void setup()
{
  size(1500,1000);
  smooth();
}

void draw()
{
   background(250); 
   drawCircle(width/2,height/2,200);
}*/