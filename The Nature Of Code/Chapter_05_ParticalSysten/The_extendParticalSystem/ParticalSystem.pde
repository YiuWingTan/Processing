class ParticalSystem
{
  PVector location;
  ArrayList<partical> particals;
  ParticalSystem(PVector locan)
  {
    location = locan.get();
    particals = new ArrayList<partical>();
  }
  
  void AddPartial()
  {
    for(int i=0;i<3;i++)
    {
       float p = random(1);
       if(p<0.5)
       particals.add(new CirPartical(location));
       else
       particals.add(new CubePartical(location));
    }
  }
  
  void  display()
  {
    for(int i = 0;i<particals.size();i++)
    {
       partical p = particals.get(i);
       p.applyForce(Data.gravity);
       p.applyForce(Attacker.CountForce(p.location));
       p.update();
       p.display();
       if(p.isDead())
       {
        particals.remove(i);
        i--;
       }
    }
    AddPartial();
  }
}