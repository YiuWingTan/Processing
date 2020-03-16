class Target
{
 PVector location;
 float len;
 
 Target()
 {
    
 }
  
  void display(float x,float y)
  {
    location = new PVector(x,y);
    fill(0);
    pushMatrix();
    translate(x,y);
    ellipse(0,0,3,3);
    line(0,0,10,0);
    line(0,0,-10,0);
    line(0,0,0,10);
    line(0,0,0,-10);
    popMatrix();
    noFill();
  }
}