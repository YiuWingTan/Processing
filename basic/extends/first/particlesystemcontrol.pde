class particlesystemcontrol
{
  float x;
  float y;
  ArrayList<particlesystem> particlesystems;
  particlesystemcontrol()
  {
    particlesystems=new ArrayList<particlesystem>();
  }
  void add()
  {
    particlesystems.add(new particlesystem(mouseX,mouseY));
  }
  void run(PVector m)
  {
    for(int i=0,j=particlesystems.size();i<j;i++)
    {
     particlesystem p=particlesystems.get(i);
     p.run(m);
    }
  }
}