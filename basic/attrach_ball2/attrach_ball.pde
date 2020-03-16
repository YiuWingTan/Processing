class attrach_ball
{
  float x;
  float y;
  float mass;
  PVector location;
  attrach_ball(float x_,float y_,float m)
  {
    x=x_;
    y=y_;
    mass=m;
    location=new PVector(x,y);
  }

PVector attrach(Be_attrach_ball balln)
{
    float dist=dist(location.x,location.y,balln.location.x,balln.location.y);
    dist=constrain(dist,5.0,150);
    float G=(mass*balln.mass)/(dist*dist);
    PVector F=PVector.sub(location,balln.location);
    F.normalize();
    if(dist<100)
    F.mult(-G*500);
    if(dist>100)
    F.mult(G*800);
    F.div(balln.mass);
    return F;
}

void show2()
  {
    noStroke();
    fill(50,255);
    ellipse(location.x, location.y, mass*16, mass*16);
  }
}