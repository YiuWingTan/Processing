class Net 
{
  ArrayList<Partical> particals;
  ArrayList<Spring> springs;
  float len;
  int hNumber;
  int wNumber;
  float strength ;
  
  Net(float _len,int _wNumber,int _hNumber,float _strength)
  {
    len = _len;
    wNumber = _wNumber;
    hNumber = _hNumber;
    particals = new ArrayList<Partical>();
    springs = new ArrayList<Spring>();
    createNet();
  }
  
  
  void createNet()
  {
    
    for(int y=0; y< hNumber; y++) {
      for(int x=0; x < wNumber; x++) {

        Partical p = new Partical(new Vec2D(width/2+x*len-wNumber*len/2,y*len));
        physics.addParticle(p);
        particals.add(p);

        if (x > 0) {
          Partical previous = particals.get(particals.size()-2);
          Spring c = new Spring(p,previous,len,strength);
          physics.addSpring(c);
          springs.add(c);
        }

        if (y > 0) {
          Partical above = particals.get(particals.size()-wNumber-1);
          Spring c=new Spring(p,above,len,strength);
          physics.addSpring(c);
          springs.add(c);
        }
      }
    }
    Partical topleft= particals.get(0);
    topleft.lock();

    Partical topright = particals.get(wNumber-1);
    topright.lock();
  }
  
  void display()
  {
    
    for(Spring p:springs)
    p.display();
  }
}