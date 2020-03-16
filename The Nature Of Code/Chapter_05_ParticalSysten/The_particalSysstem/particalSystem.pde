class particalSystem
{
  PVector location;
  ArrayList<Partical> particals;
  particalSystem(PVector loca)
  {
    location = loca.get();
    particals = new ArrayList<Partical>();
  }
  
  void run()
  {
    for(int i =0;i<particals.size();i++)
    {
      Partical node = particals.get(i);
      if(node.run())
      {
       particals.remove(i);
       println("111111111");
       i--;
      }
    }
    addPartical();
  }
  
  void addPartical()
  {
    for(int  i=0;i<6;i++)
    {
     particals.add(new Partical(location)); 
    }
  }
  
  void reSetLocation(PVector loca)
  {
    location = loca.get();
  }
}