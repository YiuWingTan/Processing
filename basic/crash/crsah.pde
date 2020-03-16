class ball
{
  int i1;
  float r1,nx=1,ny=1;
  PVector location;
  PVector speed;
  PVector jspeed;
  ball(float x_,float y_,float speedx_,float speedy_,float r1_)
  {
    location=new PVector(x_,y_);
    speed=new PVector (speedx_,speedy_);
    r1=r1_;
    
  }
  
  void step()
  {
    jspeed=new PVector (random(-0.5,0.5),random(-0.5,0.5));
    if(location.x<40||location.x>1459)
      {
        speed.x=-speed.x;
        nx*=-1;
      }
    if(location.y<40||location.y>759)
      {
        speed.y=-speed.y;
        ny*=-1;
      }
      
    speed.add(jspeed);
    location.add(speed);
  }
  
  void show()
  {
    ellipse(location.x,location.y,r1,r1);
  }
}