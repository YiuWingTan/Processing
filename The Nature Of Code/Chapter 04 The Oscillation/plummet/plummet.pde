void setup()
{
  size(1500,800);
  
}

void draw()
{
  background(255);
  strokeWeight(3);
  float T = 180;
  float A = 260;
  float x = cos(TWO_PI*frameCount/T);
  float y = (height/2)-x*x*100;
  PVector location = new PVector(A*x,y);
  //translate(width/2,height/2);
  line(width/2,0,width/2+location.x,y);
  ellipse(width/2+location.x,y,20,20);
}