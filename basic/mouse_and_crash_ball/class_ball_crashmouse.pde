class crash_ball
{
  PVector location;
  PVector speed;
  PVector jspeed;
  crash_ball(float locationx,float locationy,float speedx,float speedy)
  {
    location=new PVector(locationx,locationy);
    speed =new PVector(speedx,speedy);
    jspeed=new PVector (random(-0.05,0.05),random(-0.05,0.05));
    
  }
  
  void step()
  {
    if(mouseX>40&&mouseX<1759&&mouseY>40&&mouseY<759)
    {
      if(location.x<mouseX)
      jspeed.x=0.5;
      if(location.x>mouseX)
      jspeed.x=-0.5;
      if(location.y<mouseY)
      jspeed.y=0.5;
      if(location.y>mouseY)
      jspeed.y=-0.5;
    }
    else
    {
      jspeed.x=random(-0.05,0.05);
      jspeed.y=random(-0.05,0.05);
    }
      
       if(speed.x>20)
       speed.x=20;
       if(speed.y>20)
       speed.y=20;
      speed.add(jspeed);
    location.add(speed);
  }
  
  void show()
  {
    if(location.x<40||location.x>1459)
      {
        speed.x*=-1; 
       }
      if(location.y<40||location.y>759)
      {
        speed.y*=-1; 
      }
   ellipse(location.x,location.y,r,r); 
  }
}