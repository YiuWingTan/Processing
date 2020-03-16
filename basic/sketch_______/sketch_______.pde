float angle=0.0;
float x=150;
void setup()
{
 size(1800,800); 
 smooth();
}
void draw()
{
  background(0);
 ellipse(x,400+300*cos(angle),100,100);
 angle+=0.1;
 x+=10;
}