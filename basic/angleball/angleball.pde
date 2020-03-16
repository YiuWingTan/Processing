ball p;
void setup()
{
  size(1500,800);
  p=new ball();
}

void draw()
{
  background(255);
  p.run();
}