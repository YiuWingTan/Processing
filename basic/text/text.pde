controlparticlesystem ps;
boolean start=false;
void setup()
{
  size(1500,1000);
  ps=new controlparticlesystem();
}

void draw()
{
  background(250);
  if(start)
  ps.run();
}

void mouseReleased()
{
 ps.addsystem(mouseX,mouseY);
 start=true;
}