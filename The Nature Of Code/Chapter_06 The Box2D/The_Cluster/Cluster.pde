class Cluster
{
  ArrayList<Particel> particels;
  float diameter;
  Cluster(int n,float d,Vec2D center)
  {
    diameter = d;
    particels = new ArrayList<Particel>();
    for(int i = 0;i<n;i++)
    {
       particels.add(new Particel(center.add(Vec2D.randomVector())));
    }
    link();
  }
  
  void link()
  {
     for(int i = 0;i<particels.size();i++)
     {
       Particel p1 = particels.get(i);
        for(int j=i+1;j<particels.size();j++)
        {
           Particel p2 = particels.get(j);
           physics.addSpring(new VerletSpring2D(p1,p2,diameter,0.01));
        }
     }
  }
  
  void display()
  {
    strokeWeight(3);
      for(int i=0;i<particels.size();i++)
      {
        Particel p1 = particels.get(i);
         for(int j =i+1;j<particels.size();j++)
         {
             Particel p2 = particels.get(j);
             line(p1.x,p1.y,p2.x,p2.y);
         }
      }
      
      for(int i = 0;i<particels.size();i++)
      {
         Particel p = particels.get(i);
         p.display();
      }
  }
}