Ball []baller = new Ball[20];
PVector gravity;
PVector wind;
PVector thrust;
float setOffX = 0;
float setOffY = 10000;
void setup()
{
  size(1000,1000);
  wind = new PVector(0.01,0);
  gravity = new PVector(0,0.1);
  for(int i=0;i<baller.length;i++)
  {
    baller[i] = new Ball(); 
  }
}

void draw()
{
  wind = new PVector(map(noise(setOffX,setOffY),0,1,-0.1,0.1),0);
  background(255);
  for(int i=0;i<baller.length;i++)
  {
   //CountThrust(baller[i].location);
   baller[i].ApplyForce(gravity); 
   baller[i].ApplyForce(wind);
  // baller[i].ApplyForce(thrust);
   baller[i].Update();
   baller[i].Display();
   baller[i].CheckEdge();
 }
 setOffX+=0.01;
 setOffY+=0.01;
}

void CountThrust(PVector location)
{
  thrust = new PVector(map(location.x,0,width,-0.3,0.3),map(location.y,0,height,-0.5,0.3));
  thrust.mult(-1);
}