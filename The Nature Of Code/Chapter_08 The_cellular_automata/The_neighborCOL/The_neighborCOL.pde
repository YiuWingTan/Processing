
COL col;
void setup()
{
  size(500,500);
  col = new COL(10);
}

void draw()
{
  col.display();
}

void mousePressed()
{
   col.init(); 
}