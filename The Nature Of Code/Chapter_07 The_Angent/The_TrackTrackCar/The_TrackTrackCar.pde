Target target;
Vehicle vehicle;
TrackVehicle trackVehicle;
void setup()
{
 size(1500,1000); 
 target = new Target(3,8,0.2);
 vehicle = new Vehicle(target,5,0.1,2);
 trackVehicle = new TrackVehicle(vehicle,2,4,0.1);
 target.setTarget(vehicle,trackVehicle);
}

void draw()
{
  background(250);
  target.move();
  vehicle.move();
  trackVehicle.move();
}