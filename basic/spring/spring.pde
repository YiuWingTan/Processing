ball p;
rope r;
PVector d;
boolean drge=false;
void setup()
{
 size(1500,800);
 p=new ball();
 r=new rope();
 d=new PVector(0,0);
}

void draw()
{
  background(250);
  r.connent(p);
  r.display(p.location);
  p.run();
}
void mousePressed()
{
 p.pressed();
}

void mouseReleased()
{
  if(p.drag)
  {
    drge=false;
    p.drag=false;
  }
}