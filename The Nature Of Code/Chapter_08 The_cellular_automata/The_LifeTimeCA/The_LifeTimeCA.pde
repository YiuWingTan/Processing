
COL col;
void setup()
{
  size(800,500);
  Data.life = color(255,255,120);
  Data.lifeStrong = color(255,200,120);
  Data.dead = color(0,0,0);
  col = new COL(15);
}

void draw()
{
  col.display();
  col.generate();
  //println(1);
}

void mousePressed()
{
   col.init(); 
}