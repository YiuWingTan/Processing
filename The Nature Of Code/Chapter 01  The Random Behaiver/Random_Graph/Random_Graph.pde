Graph p;
void setup()
{
  size(1000,800);
  p = new Graph();
}


void draw()
{
  p.step();
  p.display();
}