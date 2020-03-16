
Barrier barrier;
Vehicle vehicle;
void setup()
{
  size(1500,1000);
  PVector []positions = new PVector[5];
  positions[0] = new PVector(200,50);
  positions[1] = new PVector(280,750);
  positions[2] = new PVector(width/2,height/2);
  positions[3] = new PVector(1200,100);
  positions[4] = new PVector(1300,650);
  barrier = new Barrier(10,positions);
  vehicle = new Vehicle(barrier,5,0.01,5);
}

void draw()
{
  background(250);
  barrier.display();
  vehicle.move();
}