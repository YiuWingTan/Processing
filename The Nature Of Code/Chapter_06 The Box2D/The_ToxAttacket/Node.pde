class Node
{
  ArrayList<Particle> particles;
  float n;
  float diamester;
  Node(float n,float d, Vec2D ceneter)
   {
     particles = new ArrayList<Particle>();
     diamester = d;
     for(int i = 0;i<n;i++)
     {
        particles.add(new Particle(ceneter.add(Vec2D.randomVector()))); 
     }
     link();
   }
   
   void link()
   {
      for(int i = 0;i<particles.size();i++)
      {
        Particle p1 = particles.get(i);
          for(int j = i+1;j<particles.size();j++)
          {
            Particle p2 = particles.get(j);
            physics.addSpring(new VerletSpring2D(p1,p2,diamester,0.01));
          }
      }
   }
   
   void display()
   {
     strokeWeight(2);
     for(int i = 0;i<particles.size();i++)
     {
       Particle p1 = particles.get(i);
       for(int j = i+1;j<particles.size();j++)
       {
         Particle p2 = particles.get(j);
         line(p1.x,p1.y,p2.x,p2.y);
       }
     }
     
     for(int i = 0;i<particles.size();i++)
     {
        Particle p = particles.get(i);
        p.display();
     }
   }
}