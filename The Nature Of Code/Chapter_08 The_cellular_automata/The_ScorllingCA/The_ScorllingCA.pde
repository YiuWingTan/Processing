int delay = 50000000;
CA ca;
void setup()
{
 size(1500,1000);
 ca = new CA(10);
}

void draw()
{
  ca.display();
  int count = 0;
  while(count++<delay)
  {
      println(1); 
  }
 
}