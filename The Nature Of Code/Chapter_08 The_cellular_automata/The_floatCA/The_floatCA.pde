float delay = 250000000;
COL col;
void setup()
{
  size(500,500);
  col = new COL(15);
}

void draw()
{
  int i = 0;
  background(255);
  col.display();
  col.generate();
  while(i++<delay);
}

void mousePressed()
{
 
   col.init(); 
}