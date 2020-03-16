RandomSteper randomer;
void setup()
{
  size(1000,800);
  randomer = new RandomSteper();
}

void draw()
{
  randomer.step();
  randomer.display();
}