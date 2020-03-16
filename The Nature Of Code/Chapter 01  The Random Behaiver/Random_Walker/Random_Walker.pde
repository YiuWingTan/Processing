Walker p;
void setup()
{
  size(1000,800);
  p = new Walker();
}

void draw()
{
   p.step();
   p.display();
}