class nature_ball
{
  PVector speed;
  PVector jspeed;
  PVector location;
  float mass;
  nature_ball(float x,float y)
  {
    location=new PVector(x,y);
    speed=new PVector(0,0);
    jspeed=new PVector(0,0);
    mass=random(2,15);
  }
  
  void force(PVector w,PVector g)
  {
    PVector f=  PVector.add(w,g);
    jspeed=PVector.div(f,mass);
  }
  
  void move_speedandlocation()
  {
    speed.add(jspeed);
    location.add(speed);
  }
  
  void show()
  {
    background(255);
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
    if(location.y<899-(mass*16)/2)
    {
    location.y=899-(mass*16)/2;
    speed.y*=-1;
    }
  }
}