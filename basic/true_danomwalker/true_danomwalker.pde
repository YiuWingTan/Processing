PVector location;
float t=0,t1=1000;
float x1,y1;
void setup()
{
  size(1000,800);
 //noStroke();
 
}
void draw()
{
  background(255);
  fill(89,199);
 x1=noise(t);
 y1=noise(t1);
 t+=0.01;
 t1=t1+0.01;
 location=new PVector( map(x1,0,1,0,width), map(y1,0,1,0,height));     
 ellipse(location.x,location.y,50,50);
}