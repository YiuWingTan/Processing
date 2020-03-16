class Angle
{
  PVector location2;
  PVector location1;
  PVector middle;
  float angle1;
  float angle2;
  float angle;
  float radians;
  float len1;
  float len2;
  Angle(float x,float y)
  {
    middle = new PVector(x,y);
    angle = 0;
    radians = 0;
    cout();
  }
  
  void cout()
  {
    location2 = new PVector(random(width),random(height));
    location1 = new PVector(random(width),random(height));
    PVector a1 = PVector.sub(location1,middle);
    PVector a2 = PVector.sub(location2,middle);
    len1 = a1.mag();
    len2 = a2.mag();
    angle = degrees(PVector.angleBetween(a1,a2));
    angle1 = a1.heading2D();
    angle2 = a2.heading2D();
  }
  
  void display()
  {
    pushMatrix();
    translate(middle.x,middle.y);
    rotate(angle1);
    line(0,0,len1,0);
    line(len1,0,len1-8,4);
    line(len1,0,len1-8,-4);
    popMatrix();
    pushMatrix();
    translate(middle.x,middle.y);
    rotate(angle2);
    line(0,0,len2,0);
    line(len2,0,len2-8,4);
    line(len2,0,len2-8,-4);
    popMatrix();
    
  }
  
  
}