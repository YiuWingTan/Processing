class gratity
{
  PVector speed;
  PVector gratity=new PVector(0,0.98);
  PVector location;
  PVector wind;
  PVector jspeed;
  gratity ()
  {
    location=new PVector(990,80);
    speed=new PVector(0,0);
    
  }
  
  void location_deal()
  {
   if(location.y>859)
   {
     location.y=859;
   speed.y*=-1;
   }
   if(location.x<40)
   {
     location.x=40;
     speed.x*=-1;
   }
   if(location.x>1459)
   {
     location.x=1459;
     speed.x*=-1;
   }
  }
  
  void gratity_deal()
  {
    wind=new PVector(-noise(0,0.05),0);
    jspeed=PVector.add(gratity,wind);
    speed.add(jspeed);
    location.add(speed);
  }
  void show()
  {
    ellipse(location.x,location.y,r,r);
  }
}