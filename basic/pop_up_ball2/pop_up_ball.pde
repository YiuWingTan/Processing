class pop_up_ball
{
  PVector location;
  PVector jspeed;
  PVector speed;
  float r,mass;
   pop_up_ball(float x_,float y_,float r_,float m)
  {
    location=new PVector(x_,y_);
    jspeed=new PVector();
    speed=new PVector();
    r=r_;
    mass=m;
  }
  
  void applyforce(PVector F)
  {
    jspeed.add(F);
    jspeed.div(mass);
    jspeed.mult(6);
    
  }
  
  void update()
  {
    speed.add(jspeed);
    speed.limit(20);
    location.add(speed);
    jspeed.mult(0);
  }
  
  void show()
  {
    stroke(0);
    strokeWeight(2);
    ellipse(location.x,location.y,mass*16,mass*16);
  }
  
  void check()
  {
    if(location.x<(mass*16)/2)
    {
      location.x=(mass*16)/2;
      speed.x*=-1;
    }
    if(location.x>1499-(mass*16)/2)
    {
      location.x=1499-(mass*16)/2;
      speed.x*=-1;
    }
    if(location.y<(mass*16)/2)
    {
      location.y=(mass*16)/2;
      speed.y*=-1;
    }
    if(location.y>799-(mass*16)/2)
    {
      location.y=799-(mass*16)/2;
      speed.y*=-1;
    }
  }
}