
CA ca;
void setup()
{
  size(1500,1000);
  ca = new CA(10);
  ca.display();
}

void draw()
{
  
}

void mouseWheel(MouseEvent event) {
  int e = event.getCount();
  ca.scorll(e);
}