CA ca;
void setup()
{
  size(500,500);
  ca = new CA(10);
}

void draw()
{
  background(250);
  ca.display();
}

void mousePressed()
{
 ca.init(); 
}