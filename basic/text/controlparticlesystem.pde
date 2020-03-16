class controlparticlesystem
{
  ArrayList<particlesystem>particlesystems;
  controlparticlesystem()
  {
    particlesystems=new ArrayList<particlesystem>();
  }
 void  addsystem(float x,float y)
  {
    particlesystems.add(new particlesystem(x,y));
  }
  void run()
  {
    for (int i = particlesystems.size()-1; i >= 0; i--) {
      particlesystem p = particlesystems.get(i);
      p.run();
      }
    }
  }