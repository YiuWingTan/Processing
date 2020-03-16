class nature_ball
{
  PVector speed;
  PVector jspeed;
  PVector location;
  float mass;
  PVector force_of_friction;
  nature_ball(float y)
  {
    location=new PVector(map(random(1),0,1,40,1459),y);
    speed=new PVector(0,0);
    jspeed=new PVector(0,0);
    mass=map(random(1),0,1,2,5);
  }
  
  void force(PVector w,PVector g)
  {
    
    PVector f=PVector.add(w,g);
    force_of_friction=speed.get();
    force_of_friction.mult(-1);
    force_of_friction.normalize();
    force_of_friction.mult(0.02);
    f.add(force_of_friction);
    jspeed=PVector.div(f,mass);
  }
  
  void move_speedandlocation()
  {
    speed.add(jspeed);
    location.add(speed);
  }
  
  void show()
  {
    
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
     speed.y*=-1; 
     location.y=(mass*16)/2;
    }
    if(location.y>899-(mass*16)/2)
    {
    location.y=899-(mass*16)/2;
    speed.y*=-1;
    }
  }
}