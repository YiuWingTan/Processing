class attrach_ball
{
  PVector location;
  float x,y;
  float mass;
  boolean dragging,rollover;
  attrach_ball(float x_,float y_,float m)
  {
    x=x_;
    y=y_;
    location=new PVector (x,y);
    mass=m;
  }
  
  
  void check()
  {
    float dist;
    dist=dist(mouseX,mouseY,location.x,location.y);
    if(dist<(mass*16)/2)
    rollover=true;
    if(dist<(mass*16)/2&&mousePressed)
    {
      dragging=true;
      location.x=mouseX;
      location.y=mouseY;
    }
  }
  
  void show()
  {
    //ellipseMode(CENTER);
    strokeWeight(4);
    stroke(0);
    if (dragging) fill (50);
    else if (rollover) fill(100);
    else fill(175,200);
    ellipse(location.x,location.y,mass*16,mass*16);
    dragging=false;
    rollover=false;
  }
}