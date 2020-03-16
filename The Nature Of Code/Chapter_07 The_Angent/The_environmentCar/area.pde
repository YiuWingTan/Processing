 class area
{
  Vehicle vehicle;
  float leftMaxSpeed;
  float rightMaxForce;
  float rightMaxSpeed;
  float leftMaxForce;
  float area;
  
  area(float _area,float s1,float s2,float f1,float f2,Vehicle _vehicle)
  {
    area = _area;
   leftMaxSpeed = s1;
   rightMaxSpeed = s2;
   leftMaxForce = f1;
   rightMaxForce =f2;
   vehicle = _vehicle;
  }
  
  void setAreaData(float lf,float rf,float ls,float rs)
  {
    leftMaxSpeed = ls;
    rightMaxSpeed = rs;
    leftMaxForce = lf;
    rightMaxForce = rf;
  }
  
  void perception()
  {
    PVector location = vehicle.location;
    if(location.x<area)
    {
      vehicle.changeData(leftMaxSpeed,leftMaxForce);
    }else 
    {
      vehicle.changeData(rightMaxSpeed,rightMaxForce);
    }
    
  }
  
  void display()
  {
    /*stroke(0);
    strokeWeight(3);
    fill(150);
    beginShape();
    vertex(0,0);
    vertex(0,area);
    vertex(area,height);
    vertex(0,height);
    endShape(CLOSE);
    noFill();*/
    
    fill(255,20,0);
    beginShape();
    vertex(area,0);
    vertex(width,0);
    vertex(width,height);
    vertex(area,height);
    endShape(CLOSE);
    noFill();
  }
  
  void move()
  {
    perception();
    display();
  }
}