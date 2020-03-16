Mover []mover = new Mover[5];
Liquid liquid ;
PVector gravity;
void setup()
{
  size(800,800);
  for(int i=0;i<mover.length;i++)
  {
   mover[i] = new Mover(); 
  }
  liquid = new Liquid(0,height-height/3,width,height/3,5);
}

void draw()
{
  background(255);
  liquid.display();
  for(int i =0;i<mover.length;i++)
  {
    gravity = new PVector(0,0.1*mover[i].mass);
    mover[i].ApplyForce(gravity);
    if(mover[i].isInside())
    mover[i].ApplyForce(mover[i].drag());
    mover[i].setp();
    mover[i].display();
    mover[i].checkEdge();
  }
}