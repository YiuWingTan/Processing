Mover []mover = new Mover[5];
PVector gravity;
PVector wind;
float setOffX;
void setup()
{
  size(1000, 800);
  setOffX = 1;
  gravity = new PVector(0,0.4);
  wind = new PVector(0.01,0);
  for(int i=0;i<mover.length;i++)
  {
   mover[i] = new Mover(); 
  }
}

void draw()
{
  background(255);
  for(int i=0;i<mover.length;i++)
  {
   mover[i].ApplyForce(CountFriction(mover[i].velocity,mover[i].location));
   mover[i].ApplyForce(PVector.mult(gravity,mover[i].mass));
   mover[i].ApplyForce(wind);
   mover[i].setp();
   mover[i].display();
   mover[i].CheckEdge();
   wind = new PVector(map(noise(setOffX),0,1,-0.1,0.1),0);
  }
  setOffX+=0.01;
}

PVector CountFriction(PVector velocity,PVector location)
{
  float c = ChooiceC(location.x);
  float normal = 1;
  float frictionMag = c*normal;
  PVector dirction = velocity.get();
  dirction.mult(-1);
  dirction.normalize();
  dirction.mult(frictionMag);
  return dirction;
}


float ChooiceC(float x)
{
  if(x<width/3)
  return 0.08;
  else if(x<width*2/3)
  return 0.2;
  else
  return 0.5;
}