Target target;
Vehicle vehicle;
area area;

void setup()
{
  size(1500,1000);
  target = new Target();
  vehicle = new Vehicle(target,2);
  area = new area(width/2,8,4,0.1,0.3,vehicle);
}

void draw()
{
  background(250);
  area.move();
  target.display(mouseX,mouseY);
  vehicle.move();
}