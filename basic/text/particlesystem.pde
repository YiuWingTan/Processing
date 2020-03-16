class particlesystem
{
  PVector slocation;
  ArrayList<particle> particles;
  particlesystem(float sx,float sy)
  {
    particles=new ArrayList<particle>();
    slocation=new PVector(sx,sy);
  }
  void addparticle()
  {
    for(int i=0;i<20;i++)
    particles.add(new particle(slocation.x,slocation.y));
    
  }
  void showsystem()
  {
    for (int i = particles.size()-1; i >= 0; i--) {
      particle p = particles.get(i);
      p.sport();
      p.show();
      if (p.checkdead()) {
        particles.remove(i);
      }
    }
  }
  void run()
  {
    addparticle();
    showsystem();
  }
}