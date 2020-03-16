NormalRandomer randomer;
void setup()
{
  randomer = new NormalRandomer(150);
  size(1000,800);
  for(int i=0;i<50000;i++)
  {
    randomer.step();
    randomer.display();
  }
  
}

void draw()
{
  
}