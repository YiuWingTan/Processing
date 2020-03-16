class movers
{
  PVector location;
  PVector speed;
  PVector jspeed;
  float mass;
  movers(float x,float y,float m)
  {
    mass=m;
    location=new PVector(x,y);
    speed=new PVector (0,0);
    jspeed=new PVector(0,0);
  }
  
  void forge(PVector F)
  {
    F=PVector.div(F,mass);
    jspeed.add(F);
  }
  
  void location()
  {
    speed.add(jspeed);
    location.add(speed);
    jspeed.mult(0);
  }
  
  void show()
  {
    stroke(0);
    strokeWeight(2*2.25);
    fill(127,200);
    ellipse(location.x,location.y,mass*16,mass*16);
  }
  
  void check()
  {
    if(location.y>=height-(mass*16)/2)
    {
     speed.y*=-1;
     location.y=(height-(mass*16)/2);
    }
  }

}