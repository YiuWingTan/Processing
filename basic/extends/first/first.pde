particlesystemcontrol p;
repeller r;
boolean drag=false;
void setup()
{
  size(1500,800);
  p=new particlesystemcontrol();
  r=new repeller();
}

void draw()
{
  background(250);
  p.run(r.location);
  if(drag)
  r.drag();
  r.display();
}

void mousePressed()
{
  float dist=dist(mouseX,mouseY,r.location.x,r.location.y);
  if(dist<=r.r)
  {
    r.plocation=new PVector(mouseX,mouseY);
    r.plocation.sub(r.location);
    r.plocation.mult(-1);
    drag=true;
    r.c1=0;
  }
  else
  {
  p.add();
  drag=false;
  }
}
void mouseReleased()
{
 if(drag)
 drag=false;
 r.c1=175;
}