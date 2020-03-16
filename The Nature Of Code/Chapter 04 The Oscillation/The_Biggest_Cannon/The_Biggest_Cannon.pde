Cannon cannon;
PVector gravity;
ArrayList<Gun> list = new ArrayList<Gun>();
void setup()
{
  size(1000,800);
  cannon = new Cannon();
}

void draw()
{
  background(255);
  cannon.Display();
  for(int i=0;i<list.size();i++)
  {
    gravity = new PVector(0,list.get(i).mass*0.5);
    list.get(i).ApplyForce(gravity);
    list.get(i).ApplyAngle();
    list.get(i).Update();
    list.get(i).Display();
    if(list.get(i).CheckEdge())
    list.remove(i);
  }
}

void keyPressed()
{
  list.add(new Gun());
}