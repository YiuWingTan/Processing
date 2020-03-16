
Car car;
void setup()
{
  size(1000,800);
  car = new Car();
}


void draw()
{
  background(255);
  car.ApplyForce(CheckTheForce());
  car.Update();
  car.Display();
  car.CheckEdge();
}


PVector CheckTheForce()
{
  PVector force ;
  float x = 0,y = 0;
  if(keyPressed)
  {
    if(key=='w')
    {
      y = -0.1;
    }
    if(key=='a')
    {
      x = -0.1;
    }
    if(key=='d')
    {
      x = 0.1;
    }
    
    if(key=='s')
    {
      y = 0.1;
    }
  }
  force = new PVector(x,y);
  return force;
}