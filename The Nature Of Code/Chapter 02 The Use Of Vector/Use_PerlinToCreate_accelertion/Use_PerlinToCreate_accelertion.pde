Ball baller;

void setup()
{
  size(1000,800);
  baller = new Ball();
}

void draw()
{
  baller.update();
  baller.display();
}