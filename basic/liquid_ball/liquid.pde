class liquid
{
  float wx;
  float hy;
  float w;
  float h;
  PVector liquiddrge;
  float V,C=0.15;
  liquid(float wx_,float hy_,float w_,float h_)
  {
    wx=wx_;
    hy=hy_;
    w=w_;
    h=h_;
  }
  
  void show()
  {
    fill(50);
    noStroke();
    rect(wx,hy,w,h);
  }
  boolean text(move m)
  {
    if(m.location.y>=hy-(m.mass*16)/2&&m.location.y<899-(m.mass*16)/2)
    return true;
    else
    return false;
  }
  
  PVector liquiddrge(move m)
  {
    V=m.speed.mag();
    V=V*V*C;
    liquiddrge=m.speed.get();
    liquiddrge.normalize();
    liquiddrge.mult(V);
    liquiddrge.mult(-1);
    return liquiddrge;
  }
}