Bob bob;
void setup()
{
  size(1000,800);
  bob = new Bob(width/2,0,PI/4,150);
}

void draw()
{
  background(255);
  bob.Update();
  bob.Display();
}