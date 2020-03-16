class attrach_ball
{
  PVector location2;
  float mass;
  attrach_ball(float x,float y,float m)
  {
    location2=new PVector(x,y);
    mass=m;
  }
  
  
  void show()
  {
    fill(50);
    noStroke();
    ellipse(location2.x,location2.y,mass*16,mass*16);
  }
}