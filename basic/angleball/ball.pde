class ball
{
  float angle;
  float aspeed;
  float ajspeed;
  PVector location;
  PVector origin;
  float damping;
  float G=0.9;
  float r=400;
  float dist;
  boolean relax=false;
  ball()
  {
    angle=PI/2;
    aspeed=0;
    ajspeed=0;
    origin=new PVector(width/2,0);
    location=new PVector(origin.x+r*sin(angle),origin.y+r*cos(angle));
    damping=0.99;
   
  }
  
  void update()
  {
    fill(175);
  ajspeed=(-1*G*sin(angle))/r;
  if(!check())
  {
   aspeed+=ajspeed;
   aspeed*=damping;
   angle+=aspeed;  
  }
  location.x=r*sin(angle);
  location.y=r*cos(angle);
  location.add(origin);
  }
  
  boolean check()
  {
    dist=dist(mouseX,mouseY,location.x,location.y);
    if(mousePressed)
    {
    if(dist<=60||relax)
    {
      fill(150,22,36);
      relax=true;
      if(mouseX>width/2)
      {
       angle=atan2(mouseX-width/2,mouseY); 
      }
      else
      {
        angle=-1*atan2(width/2-mouseX,mouseY);
      }
      return true;
    }
    }
    else {
      relax=false;
      return false;
    }
    return false;
  }
  
  
  void display()
  {
    stroke(0);
    line(origin.x,origin.y,location.x,location.y);
    ellipse(location.x,location.y,60,60);
    noFill();
  }
  

  void run()
  {
   update();
   display();
  }
}