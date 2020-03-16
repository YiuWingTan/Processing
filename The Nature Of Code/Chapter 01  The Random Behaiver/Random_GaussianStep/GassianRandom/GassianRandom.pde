GaussianRandomer randomer;
void setup()
{
  randomer = new GaussianRandomer(5);
  size(1000,800);
}

void draw()
{
  randomer.step();
  randomer.display();
}