class Oscillator
{
  PVector angle;
  PVector angularVelocity;
  PVector amplitude;
  
  Oscillator()
  {
    angle=  new PVector(0,0);
    angularVelocity = new PVector(0.05,0.05);
    amplitude = new PVector(random(width/2),random(height/2));
  }
  
  void osillate()
  {
   angle.add(angularVelocity); 
  }
  
  void Display()
  {
    strokeWeight(2);
    float x = sin(angle.x)*amplitude.x;
    float y = sin(angle.y)*amplitude.y;
    pushMatrix();
    translate(width/2,height/2);
    //stroke();
    fill(175);
    line(0,0,x,y);
    ellipse(x,y,20,20);
    popMatrix();
  }
}