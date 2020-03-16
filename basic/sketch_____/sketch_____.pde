float speed=10,angle=0.0;
float x=80,y=400;
float weight=80,heigh=80,x1=430,y1=240;
int diration=1;
float jump=0;
boolean press=false;
void setup()
{
 size(1000,800);
 smooth();
}
void draw()
{
  background(0);
  x+=diration*speed;
  if(x<=40||x>=959)
  diration=-diration;
  if(mousePressed)
  press=true;
  if(press==true){
  angle+=0.1;
  }
  else press=false;
  ellipse(x,y-jump,weight,heigh);
  rect(x1,y1,100,200);
}  