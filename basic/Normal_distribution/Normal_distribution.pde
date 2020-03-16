float diration;
float step=60;
float x=500;
void setup()
{
  noStroke();
 size(1000,800);
 fill(2,10);
 }
void draw()
{
 diration= randomGaussian();
 ellipse(x+diration*step,400,80,80);
}