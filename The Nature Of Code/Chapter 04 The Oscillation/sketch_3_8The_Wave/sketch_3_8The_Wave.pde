float startAngle = 0;

float velocity = 0.3;
float acceleration = 0;
float amplitude = 100;
void setup()
{
  size(1000,800);
}

void draw()
{
  strokeWeight(3);
  background(255);
  float angle = startAngle;
  for(int x =0;x<width;x+=20)
  {
    float y  = amplitude*sin(angle)+height/2;
    PVector location = new PVector(x,y);
    float r = map(location.y,height/2-amplitude,height/2+amplitude,20,35);
    ellipse(location.x,location.y,r,r);
   angle+=velocity;
   noFill();
  }
  startAngle+=0.03;
  
}