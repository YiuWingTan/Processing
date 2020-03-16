
Steper steper;
void setup()
{
  size(1000,800);
  steper = new Steper();
}

void draw()
{
  steper.step();
  steper.display();
}