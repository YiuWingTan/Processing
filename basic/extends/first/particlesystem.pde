class particlesystem
{
  PVector location;
  ArrayList<particle> particles;
  particlesystem(float x,float y)
  {
    particles=new ArrayList<particle>();
    location=new PVector(x,y);
  }
  void add()
  {
    if(random(1)<0.5)
    particles.add(new particle(location.x,location.y));
    else 
    particles.add(new confetti(location.x,location.y));
  }
  void run(PVector m)
  {
    for(int i=0;i<5;i++)
    add();
   for(int i=particles.size()-1;i>=0;i--)
   {
     particle p=particles.get(i);
     p.run(m);
     if(p.check())
     particles.remove(i);
   }
  }
}