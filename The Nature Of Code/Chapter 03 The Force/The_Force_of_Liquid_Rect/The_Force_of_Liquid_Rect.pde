Mover[]mover = new Mover[5];
Liquid liquid;
void setup()
{
  size(1000,800);
  liquid  = new Liquid(0,height - height/3,width,height/3,123,0.1);
  for(int i=0;i<mover.length;i++)
  mover[i] = new Mover();
}

void draw()
{
  background(255);
  liquid.display();
  for(int i =0;i<mover.length;i++)
  {
    BasicForce.Gravity = new PVector(0,0.1*mover[i].mass);
    mover[i].ApplyForce(BasicForce.Gravity);
    if(mover[i].isInside(liquid))
    mover[i].ApplyForce(liquid.CalculateForce(mover[i].velocity,mover[i].w));
    mover[i].Setp();
    mover[i].Display();
    mover[i].CheckEdge();
  }
}