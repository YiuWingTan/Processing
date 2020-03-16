
ArrayList<Vehicle> vehicles;
Path path;
void setup()
{
  size(1500,1000);
  vehicles = new ArrayList<Vehicle>();
  path = new Path(30);
}

void draw()
{
  background(250);
  path.display();
  for(int i= 0;i<vehicles.size();i++)
  {
      Vehicle p = vehicles.get(i);
      p.move();
  }
  
}

void mousePressed()
{
  vehicles.add(new Vehicle(path,5,0.2,3)); 
}