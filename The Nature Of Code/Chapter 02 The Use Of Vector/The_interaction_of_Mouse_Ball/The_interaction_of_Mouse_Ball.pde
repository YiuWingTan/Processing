Walker walker;
void setup()
{
  size(1000,800);
  walker = new Walker();
}

void draw()
{
  walker.update();
  walker.display();
}