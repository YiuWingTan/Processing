ArrayList<Vehicle>vehicles;
void setup()
{
  size(1500,1000);
  vehicles = new ArrayList<Vehicle>();
  for(int i = 0;i<20;i++)
  {
     vehicles.add(new Vehicle(3,5,0.2,50)); 
  }
}

void draw()
{
  background(250);
  for(Vehicle v:vehicles)
  {
     v.applyBehaviors(vehicles); 
     v.run();
  }
}

void mousePressed()
{
  vehicles.add(new Vehicle(3,5,0.2,50)); 
}