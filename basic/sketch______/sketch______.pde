float angle=0;
float av=0.1;
float x;
float y;
float r=100;
void setup()
{
 size(1500,1000);
}
void draw()
{
  for(int i=0;i<50;i++)
  {
    fill(random(250),random(250),random(250));
    x=r*cos(angle);
    y=r*sin(angle);
    ellipse(width/2+x,height/2+y,16,16);
    angle+=av;
    r+=0.02;
  }
}