Plane plane;

void setup()
{
  size(1000,800);
  plane = new Plane();
}

void draw()
{
  plane.ControllThePlane();
  plane.applyFriction();
  plane.Update();
  plane.Display();
  plane.CheckEdge();
}



  