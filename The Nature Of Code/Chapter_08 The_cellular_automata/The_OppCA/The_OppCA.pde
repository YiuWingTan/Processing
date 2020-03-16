
COL col;
void setup()
{
  size(800,500);
  col = new COL(20,40);
  col.display();
}

void draw()
{
  col.generate();
  col.display();
}

void mousePressed()
{
 col.generate();
  col.display();
}