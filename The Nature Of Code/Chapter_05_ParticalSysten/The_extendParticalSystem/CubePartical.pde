class CubePartical extends partical
{
  float angle;
  float angleSpeed;
  float angleAcceleration;
  float r;
  
  CubePartical(PVector locan)
  {
     super(locan);
     angle = 0;
     angleSpeed = random(0.1,0.3);
    
     r = random(3,9);
  }
  
  void display()
  {
    strokeWeight(2);
    angle +=angleSpeed;
    pushMatrix();
    translate(location.x,location.y);
    rotate(angle);
    rect(0,0,r,r);
    popMatrix();  
  }
}