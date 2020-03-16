
Target target;
Vehicle vehicle;
void setup()
{
  size(1000,800);
  target = new Target();
  vehicle = new Vehicle(target,6,0.1,5);
}

void draw()
{
  background(250);
  target.display(mouseX,mouseY);
  vehicle.move();
}