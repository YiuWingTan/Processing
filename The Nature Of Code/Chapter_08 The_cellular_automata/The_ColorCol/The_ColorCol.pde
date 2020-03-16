float delay = 2500;
COL col;
void setup()
{
  size(800,500);
  col = new COL(2);
  
  col.display();
  col.generate();
}

void draw()
{
  int i =0;
  background(250);
  col.display();
  col.generate();
  //while(i++<delay);
}

void mousePressed()
{
   col.init();
}