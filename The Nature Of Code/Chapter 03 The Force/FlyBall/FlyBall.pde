Ball baller;
PVector wind;
PVector buoyancy;
float setOffX;
float setOffY;
void setup()
{
  size(1000,800);
  setOffX = 0;
  setOffY = 10000;
  buoyancy= new PVector(0,-0.02);
  wind = new PVector(0,0);
  baller = new Ball();
}

void draw()
{
  wind = new PVector(map(noise(setOffX,setOffY),0,1,-0.02,0.02),0);
  setOffX+=0.01;
  setOffY+=0.01;
  baller.ApplyForce(buoyancy);
  baller.ApplyForce(wind);
  baller.Update();
  baller.Display();
  baller.CheckEags();
}