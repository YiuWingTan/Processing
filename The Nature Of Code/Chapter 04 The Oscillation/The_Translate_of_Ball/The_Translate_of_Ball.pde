PVector point1;
PVector point2;
float angle = 0;
float r1 = 20;
float r2 = 20;
void setup()
{
  size(1000,800);
  point1 = new PVector(100,100);
  point2 = new PVector(-100,-100);
}

void draw()
{
  background(255);
  translate(width/2,height/2);
  rotate(angle);
  strokeWeight(5);
  line(point1.x,point1.y,point2.x,point2.y);
  ellipse(point1.x,point1.y,r1,r1);
  ellipse(point2.x,point2.y,r2,r2);
  angle+=0.01;
}