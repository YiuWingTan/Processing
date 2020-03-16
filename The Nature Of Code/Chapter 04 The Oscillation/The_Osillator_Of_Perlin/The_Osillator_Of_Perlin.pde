float angle = 0;
float velocity = 0.3;
float startAngle = 0;
PShape s;
float px,py;
void setup()
{
  size(1800,1000);
}

void draw()
{
  
  background(25,125,200);
  angle = startAngle;
  
  for(int x=0;x<width;x+=24)
  {
    float y = map(sin(angle),-1,1,0,height);
    float r = map(cos(angle),-1,1,10,30);
    strokeWeight(2);
    ellipse(x,y,r,r);
    if(x!=0)
    {
      strokeWeight(1);
      line(x,y,px,py);
    }
    angle+=velocity;
    px = x;
    py = y;
  }
  startAngle+=0.01;
}