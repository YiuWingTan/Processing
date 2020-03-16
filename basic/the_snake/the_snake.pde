snake p;
food food;
void setup()
{
  size(1000,800);
  p=new snake();
  food=new food();
}

void draw()
{
  p.sport();
  p.iseat(food);
  food.display();
}
void keyReleased()
{
  p.addmark();
}