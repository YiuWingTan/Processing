
COL col;
void setup()
{
  size(1500,1000);
  col = new COL(10);
}

void draw()
{
  background(255);
  col.display();
  col.bump();
}

void mousePressed()
{
    col.addBoid();
}