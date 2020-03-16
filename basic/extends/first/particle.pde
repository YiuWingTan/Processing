class particle
{
  PVector location;
  PVector speed;
  PVector jspeed;
  color c1;
  float G;
  boolean max=false;
  particle(float x,float y)
  {
   location=new PVector(x,y);
   speed=new PVector(random(-2,2),random(2));
   c1=color(233,10,91);
   G=0.1;
   jspeed=new PVector(0,-0.15);
  }
  
  void update()
  {
    speed.add(jspeed);
    if(max)
    {
     speed.x=constrain(speed.x,-2.2,2.2);
     speed.y=constrain(speed.y,-2.2,2.2);  
    }
    location.add(speed);
    jspeed.y=-0.15;
    jspeed.x=0;
  }
  void  applyforce(PVector force)
  {
    PVector dir=PVector.sub(force,location);
    float d=dir.mag();
   if(d<70) {
     d=0.15;
   max=true;
   }
   else
   {
    d=constrain(d,100,400);
    max=false;
   }
    dir.normalize();
    float f=-1*G/(d);
    dir.mult(f);
    jspeed.add(dir);
  }
  boolean check()
  {
    boolean dead=false;
   if(location.x<0||location.x>width)
   dead=true;
   if(location.y<0||location.y>height)
   dead=true;
   return dead;
  }
  
  void display()
  {
    stroke(0);
    fill(c1);
    ellipse(location.x,location.y,8,8);
  }
  void run(PVector m)
  {
  applyforce(m);
   update();
   display();
  }
}