class move
{
  PVector speed;
  PVector jspeed;
  PVector location;
  float mass;
  PVector gratity;
  move(float x,float y,float m)
  {
   mass=m;
   location=new PVector(x,y);
   speed=new PVector(0,0);
   gratity=new PVector (0,mass*0.1);
   jspeed=new PVector(0,0);
   gratity.mult(mass);
  }
  
  void cont(PVector LF)
  {
    
    jspeed.add(LF);
    jspeed.add(gratity);
    jspeed.div(mass);
    speed.add(jspeed);
    location.add(speed);
  }
  
  void check()
  {
    if(location.y>899-(mass*16)/2)
    {
      location.y=(899-(mass*16)/2);
      speed.y*=-1;
    }
  }
  
  void show()
  {
    stroke(0);
    strokeWeight(2);
    fill(127, 200);
    ellipse(location.x,location.y,mass*16,mass*16);
    jspeed=new PVector(0,0);
  }
}