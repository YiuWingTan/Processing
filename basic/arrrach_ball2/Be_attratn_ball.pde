class Be_attrach_ball
{
  float mass;
  PVector location1;
  PVector speed;
  PVector jspeed;
  float j1=1,j2=-1;
  Be_attrach_ball(float x_,float y_,float mass_)
  {
    
    mass=mass_;
    location1=new PVector(x_,y_);
    speed=new PVector(map(random(1),0,1,-4,6),map(random(1),0,1,-4,6));
    jspeed=new PVector(0,0);
  }
  
  void attrach(PVector F,float dist)
  {
    jspeed=F;
    jspeed.mult(-1);
  }
  
  void location()
  {
    speed.add(jspeed);
    location1.add(speed);
  }
  
  void check()
  {
    if(location1.x<(mass*16)/2||location1.x>1499-(mass*16)/2)
    speed.x*=-1;
    if(location1.y<(mass*16)/2||location1.y>899-(mass*16)/2)
    speed.y*=-1;
  }
  
  void show()
  {
    fill(50);
    noStroke();
    ellipse(location1.x,location1.y,mass*16,mass*16);
    
  }
}