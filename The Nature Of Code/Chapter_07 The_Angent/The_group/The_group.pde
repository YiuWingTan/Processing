
ArrayList<Vehicle> vehicles;
void setup()
{
  size(1500,1000);
  vehicles = new ArrayList<Vehicle>();
  for(int i = 0;i<100;i++)
  {
     vehicles.add(new Vehicle(5,0.02)); 
  }
}

void draw()
{
  background(150);
  for(Vehicle v:vehicles)
  {
     v.collect(vehicles);
     v.run();
  }
}