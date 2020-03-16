
Box box;
void setup()
{
  size(1500,800);
  box = new Box(PI/3);
}

void draw()
{
  background(55,110,200);
  box.Calculate();
  box.Update();
  box.Display();
}