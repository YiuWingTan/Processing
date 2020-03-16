
float r = 50;
float angle = 0;
void setup()
{
  background(255);
  size(1000,800);
  smooth();
}

void draw()
{
  fill(0);
  float x = r*cos(angle);
  float y = r*sin(angle);
  ellipse(x+width/2,y+height/2,30,30);
  angle +=0.01;
  r+=0.05;
}