MouseRandom randomer;
void setup()
{
  randomer = new MouseRandom();
  size(1000,800);
}

void draw()
{
  randomer.step();
  randomer.display();
}