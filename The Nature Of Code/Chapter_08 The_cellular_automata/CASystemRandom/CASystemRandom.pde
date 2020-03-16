
CA ca;
int delay;
void setup()
{
  size(1500,1000);
  ca = new CA(5);
  delay = 50;
  background(250);
}

void draw()
{
  int count = 0;
  ca.display();
  ca.generate();
  while(count++<delay);
  if(ca.finished())
  {
    int n = 0;
    while(n++<delay);
    ca.reSet();  
  }
  
}

void mousePressed()
{
    ca.reSet();
}