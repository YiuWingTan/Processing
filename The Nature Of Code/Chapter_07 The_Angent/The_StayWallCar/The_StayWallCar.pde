
Vehicle vehicle;
Edge edge;
void setup()
{
  size(1500,1000);
  edge = new Edge(100,100);
  vehicle = new Vehicle(6,0.2,3,edge);
  
}

void draw()
{
  background(250);
  edge.display();
  vehicle.move();
}