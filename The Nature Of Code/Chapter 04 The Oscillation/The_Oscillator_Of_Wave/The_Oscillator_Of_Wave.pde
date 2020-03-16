Wave p1;
Wave p2;
void setup()
{
  size(1500,800);
  p1 = new Wave(100,500,100,220);
  p2 = new Wave(500,900,150,160);
}

void draw()
{
  background(255);
  //p1.Dispaly();
  p2.Dispaly();
}