Mover mover;
void setup()
{
  size(1000,800);
  
  mover = new Mover();
}

void draw()
{
  background(55,110,200);
  mover.Update();
  mover.Display();
}