class SystemController
{
  ArrayList<particalSystem> systems;
  SystemController()
  {
    systems = new ArrayList<particalSystem>();
  }
  
  void AddSystem(PVector locan)
  {
    systems.add(new particalSystem(locan));
  }
  
  void display()
  {
    for(int i=0;i<systems.size();i++)
    {
      particalSystem p = systems.get(i);
      p.display();
    }
  }
}