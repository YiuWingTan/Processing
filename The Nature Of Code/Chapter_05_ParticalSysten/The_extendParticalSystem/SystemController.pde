class SystemController
{
  ArrayList<ParticalSystem> systems;

  SystemController()
  {
    systems = new ArrayList<ParticalSystem>();
  }

  void AddSystem(PVector locan)
  {
    systems.add(new ParticalSystem(locan));
  }
  
  void display()
  {
    for(int i =0;i<systems.size();i++)
    {
       ParticalSystem node = systems.get(i);
       node.display();
    }
  }
}