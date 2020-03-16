class particalSystem
{
  PVector location;
  ArrayList<partical> particals;
  int c;
  particalSystem(PVector locan)
  {
    c = (int)random(0,255);
    particals = new ArrayList<partical>();
    location = locan.get();
  }
  
  void AddPartical()
  {
    for(int i = 0;i<4;i++)
    particals.add(new partical(new PVector(location.x,location.y)));
  }
  
  void display()
  {
    for(int i = 0;i<particals.size();i++)
    {
        partical p = particals.get(i);
        p.applyForce(Data.gravity);
        p.update();
        p.Display(c);
        if(p.isDead())
        {
          particals.remove(i);
          i--;
        }
    }
    AddPartical();
  }
}