class liquid
{
  float x;
  float y;
  float w;
  float h;
  float c;
  liquid(float x_,float y_,float w_,float h_,float c_)
  {
    x=x_;
    y=y_;
    w=w_;
    h=h_;
    c=c_;
  }
  
  void show()
  {
    fill(50);
    noStroke();
    rect(x,y,w,h);
  }
  
  
  boolean contain(movers m)
  {
    return (m.location.y>height/2-(m.mass*16)/2&&m.location.y<=height-(m.mass*16)/2);
  }
  
  
  PVector liquid_forge(movers f)
  {
    float V=f.speed.mag();
    float speedv=-V*V*c;
    PVector F=f.speed.get();
    F.normalize();
    F.mult(speedv);
    return F;
  }
}