class mouse_ball
{
  PVector speed;
  PVector jspeed;
  PVector location;
  PVector dist;
  PVector mouse;
  float r=80;
  float raise=0.5,down=-0.08,dis;
  mouse_ball(float x,float y)
  {
    location=new PVector(x,y);
    speed=new PVector(random(2,8),random(2,12));
    
  }
  
  void datejspeed()
  {
    if(mouseX>40&&mouseX<1459&&mouseY>40&&mouseY<859)
    {
      mouse=new PVector(mouseX,mouseY);
      dist=PVector.sub(mouse,location);
      dist.normalize();
      dis=dist(location.x,location.y,mouse.x,mouse.y);
      if(dis>350)
      {
        dist.mult(raise);
        raise+=0.001;
      }
      else
      {
        dist.mult(down);
        down+=-0.0001;
      }
      jspeed=dist;
    }
    else
    {
      jspeed=new PVector(random(-0.08,0.08),random(-0.08,0.08));
    }
  }
  
  void sport()
  {
    if(speed.x>20)
   speed.x=20;
   if(speed.y>20)
   speed.y=20;
   if(speed.x<-20)
   speed.x=-20;
   if(speed.y<-20)
   speed.y=-20;
   if(location.x<40||location.x>1459)
   { if(location.x<40)
      location.x=40;
      else
      location.x=1459;
     speed.x*=-1;
   }
   if(location.y<40||location.y>859)
     {
       if(location.y<40)
       location.y=40;
       else
       location.y=859;
       speed.y*=-1;
     }
       speed.add(jspeed); 
       location.add(speed);
 }
  
  void show()
  {
   ellipse(location.x,location.y,r,r); 
  }
}