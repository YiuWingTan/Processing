Path path;
ArrayList<Vehicle> vehicles;

void setup()
{
  size(1500,1000);
  path = new Path(30);
  vehicles = new ArrayList<Vehicle>();
}

void draw()
{
  background(250);
  path.display();
  for(Vehicle v:vehicles)
  {
     v.run(); 
     v.follow(path);
  }
}

void mousePressed()
{
    vehicles.add(new Vehicle(3,0.2,3));
}