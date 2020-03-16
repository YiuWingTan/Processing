class ball
{
  PVector location;
  PVector speed;
  PVector jspeed;
  PVector G;
  PVector dragOffset;
  float damping;
  boolean drag=false;
  float r=250;
  ball()
  {
   location=new PVector(width/2-r,r); 
   G=new PVector(0,0.98);
   speed=new PVector(0,0);
   jspeed=new PVector(0,0);
   dragOffset=new PVector();
   damping=0.99;
  }
  
  void applyforce(PVector force)
  {
    if(!drag)
    {
      jspeed.add(force);
      speed.add(jspeed);
      speed.mult(damping);
      location.add(speed);
      jspeed.mult(0);
    }
    else 
    {
      speed.mult(0);
    }
  }
  
  void display()
  {
    stroke(0);
    strokeWeight(2);
    fill(175);
    ellipse(location.x,location.y,60,60);
  }
  void drag(float mx,float my)
  {
   if(drag)
   {
     location.x = mx + dragOffset.x;
     location.y = my + dragOffset.y;
   }
  }
  
  void pressed()
  {
    float dist=dist(mouseX,mouseY,location.x,location.y);
    if(dist<=60)
    {
      dragOffset.x = location.x-mouseX;
      dragOffset.y = location.y-mouseY;
      drag=true;
    }
  }
  
  void run()
  {
    applyforce(G);
    drag(mouseX,mouseY);
    display();
  }
}