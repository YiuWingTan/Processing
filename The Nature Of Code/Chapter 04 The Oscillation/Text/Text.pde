float angle = 0;
float velocity = 0.1;
float ampiltude = 120;
void setup()
{
  size(1000,800);
}

void draw()
{
  background(255);
  translate(width/2,height/2);
  float x = ampiltude*cos(angle);
  float y = 0;
  line(0,0,x,y);
  ellipse(x,y,60,60);
  angle+=velocity;
}