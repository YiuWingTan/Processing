class rope
{
  float k;
  float restLength;
  PVector origin;
  float x;
  float currentLength;
  
  rope()
  {
    k=0.1;
    origin=new PVector(width/2,0);
    restLength=250;
  }
  void connent(ball p)
  {
    PVector force=PVector.sub(p.location,origin);
    currentLength=force.mag();
    x=currentLength-restLength;
    force.normalize();
    force.mult(-1*k*x);
    p.applyforce(force);
  }
  
  void display(PVector location)
  {
    stroke(0);
    strokeWeight(2);
    fill(175);
    line(location.x,location.y,origin.x,origin.y);
    rect(width/2-20,0,40,40);
  }
 
}