Mover []mover = new Mover[10] ;
Attractor attractor;
void setup()
{
  for(int i=0;i<mover.length;i++)
  {
   mover[i] = new Mover(); 
  }
  attractor = new Attractor();
  size(1000,800);
  
}

void draw()
{
  background(245);
  attractor.Display();
  for(int i=0;i<mover.length;i++)
  {
    mover[i].ApplyForce(attractor.Attaract(mover[i]));
    mover[i].Update();
    mover[i].display();
    mover[i].CheckEdge();
  }
  
}