Vehicle vehicle;
Target target;
void setup()
{
  size(1500,1000);
  target = new Target(30,100);
  vehicle = new Vehicle(target,6,0.2,6);
  target.setTarget(vehicle);
}

void draw()
{
  background(250);
  target.move();
  vehicle.move();
}