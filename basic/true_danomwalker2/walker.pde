class walker
{
  float stepx,stepy;
  float r1;
  int i1;
  walker(float r1_,int i1_)
  {
    r1=r1_;
    i1=i1_;
  }
  
  void step()
  {
    tx[i1]+=0.01;
    stepx=map(noise(tx[i1]),0,1,-5,5);
    ty[i1]+=0.01;
    stepy=map(noise(ty[i1]),0,1,-5,5);
    x[i1]+=stepx;
    y[i1]+=stepy;
  }
  
  void move()
  {
    
    ellipse(x[i1],y[i1],r,r);
  }
}