class Be_attrach_ball
{
  float x;
  float y;
  PVector speed;
  PVector jspeed;
  PVector location;
  float mass;
  float n1,n2,n3;
  Be_attrach_ball(float x_,float y_,float m)
  {
    x=x_;
    y=y_;
    location=new PVector(x,y);
    speed=new PVector(map(random(1),0,1,2,6),map(random(1),0,1,2,6));
    jspeed=new PVector(0,0);
    mass=m;
    n1=map(random(1),0,1,0,255);
    n2=map(random(1),0,1,0,255);
    n3=map(random(1),0,1,0,255);
  }
  
  void attrach(Be_attrach_ball balln)
  {
    float dist=dist(location.x,location.y,balln.location.x,balln.location.y);
   dist=constrain(dist,5.0,150);
    float G=(mass*balln.mass)/(dist*dist);
    PVector F=PVector.sub(location,balln.location);
    F.normalize();
    if(dist<100)
    F.mult(G*100);
    if(dist>100)
    F.mult(-G*100);
    F.div(mass);
    jspeed.add(F);
  }
  
  void location()
  {
    speed.limit(25);
    speed.add(jspeed);
    location.add(speed);
    jspeed.mult(0);
  }
  
  void show()
  {
    fill(n1,n2,n3);
    noStroke();
    ellipse(location.x,location.y,mass*16,mass*16);
    
  }
  //llllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllll
  void check()
  {
    if(location.x<(mass*16)/2||location.x>width-(mass*16)/2)
    speed.x*=-1;
    if(location.y<(mass*16)/2||location.y>height-(mass*16)/2)
    speed.y*=-1;
  }
  //lllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllll
}