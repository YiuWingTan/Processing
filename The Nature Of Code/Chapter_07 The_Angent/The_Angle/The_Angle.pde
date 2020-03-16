
Angle angle;
void setup()
{
  size(1500,1000);
  angle = new Angle(width/2,height/2);
}

void draw()
{
  background(250);
  angle.display();
  text();
}

void mousePressed()
{
   angle.cout(); 
}

void text()
  {
    fill(0);
    textAlign(LEFT);
    text("The angle is "+angle.angle,5,100);
  }