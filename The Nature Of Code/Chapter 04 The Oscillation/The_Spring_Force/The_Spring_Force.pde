PVector gravity;
Bob bob;
Spring spring;
void setup()
{
  size(1000,800);
  bob = new Bob();
  spring = new Spring(width/2,0,200);
  gravity = new PVector(0,4);
}

void draw()
{
  background(255);
  bob.ApplyForce(gravity);
  spring.Connect(bob);
  bob.Update();
  spring.Display(bob);
  bob.Display();
}