class space
{
  PVector location;
  PVector jspeed;
  PVector speed;
  float angle;
  float mass;
  float turn;
  space(float x,float y,float m)
  {
    location=new PVector(x,y);
    speed=new PVector(map(random(1),0,1,-4,4),map(random(1),0,1,-4,4));
    jspeed=new PVector(0,0);
    mass=m;
  }
  
  void turn()
  {
    //float turn=speed.y/speed.x;
   angle=atan2(speed.y,speed.x);
  
  }
  
  void applyforge(attrach_ball ball)
  {
    float dist=dist(location.x,location.y,ball.location.x,ball.location.y);
    float diration=1;
    PVector attrachF=PVector.sub(location,ball.location);
    attrachF.normalize();
    if(dist<(mass*16)/2+150)
    diration=1;
    if(dist>(mass*16)/2+150)
    diration=-3;
    dist=constrain(dist,5,20);
   float G=(mass*ball.mass)/(dist*dist)*diration;
    attrachF.mult(G);
    jspeed=attrachF;
  }
  
  
  
  void update()
  {
    speed.add(jspeed);
    speed.limit(30);
    location.add(speed);
  }
  
  
  void show()
  {
    fill(0);
    pushMatrix();
   translate(location.x,location.y);
   rotate(angle);
   triangle(0,0,-15,15,-15,-15);
   ellipse(-20,12,5,5);
   ellipse(-20,-12,5,5);
   popMatrix();
 }
 
 
 void check()
 {
   if(location.x<(mass*16)/2)
    {
      location.x=(mass*16)/2;
      speed.x*=-1;
    }
    if(location.x>width-(mass*16)/2)
    {
      location.x=width-(mass*16)/2;
      speed.x*=-1;
    }
    if(location.y<(mass*16)/2)
    {
      location.y=(mass*16)/2;
      speed.y*=-1;
    }
    if(location.y>height-(mass*16)/2)
    {
      location.y=height-(mass*16)/2;
      speed.y*=-1;
    }
 }
}