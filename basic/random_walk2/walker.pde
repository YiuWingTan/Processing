class walker
{
  int i;
  float r;
  float random;
  walker(int i_,float r_)
  {
    i=i_;
    r=r_;
  }
  
  void laction()
  {
    random=random(2);
    if(random<0.6) {x1[i]++;y1[i]++;}
    else 
    if(random<0.8) y1[i]--;
    else
    if(random<1) y1[i]++;
    else
    if(random<1.2) x1[i]--;
    else
    if(random<1.4) x1[i]++;
    else
    if(random<1.6) {x1[i]--;y1[i]--;}
    else
    if(random<1.8) {x1[i]++;y1[i]--;}
    else
    if(random<2) {x1[i]--;y1[i]++;}
  }
  
  void show()
  {
    ellipse(x1[i],y1[i],r,r);
  }
}