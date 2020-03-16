class particle
{
  PVector location;
  PVector speed;
  PVector jspeed=new PVector(0,0.3);
  particle(float x,float y)
  {
    location=new PVector(x,y);
    speed=new PVector(0,0);
    if(random(1)<0.5){
      speed.x=random(-3,0);
  }
    else speed.x=random(0,3);
    if(random(1)<0.5) speed.y=random(-3,0);
    else speed.y=random(0,3);
  }
  void sport()
  {
    speed.add(jspeed);
    location.y+=speed.y;
    location.x+=speed.x;
  }
  
  void show()
  {
    stroke(0);
    strokeWeight(2);
    fill(120,52,2);
    ellipse(location.x,location.y,1,1);
  }
 boolean checkdead()
  {
    if(location.x>width||location.y>height||location.x<0||location.y<0)
    return true;
    else 
    return false;
  }
}