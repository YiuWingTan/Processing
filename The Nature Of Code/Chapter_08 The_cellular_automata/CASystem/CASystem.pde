
CA ca;
void setup()
{
  size(1500,1000);
  background(255);
  ca = new CA(5);
  ca.display();
}

void  draw()
{
  
}

void mousePressed()
{
   ca.reSet(); 
}