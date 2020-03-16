Plane plane;
void setup()
{
  size(1500,800);
  plane = new Plane();
  BasicForce.Gravity = new PVector(0.1,0);
}


void draw()
{
  background(255);
  plane.ApplyForce(BasicForce.Gravity);
  plane.ApplyForce(BasicForce.CalculateLiquid(plane.velocity));
  plane.setp();
  plane.Display();
  plane.CheckEdge();
}