jumpball ball2;
ball ball1;
int n=1,n1=1;
PImage Img;
void setup()
{
  size(1000,800);
 smooth();
 ball1=new ball(40,500,80,5); 
 ball2=new jumpball(400,460,80,80);
 Img=loadImage("2.jpg");
 }
 void mouseReleased()
{
  if(mouseX>=800&&mouseY>=600)
  {
     n++;
  }
}   
void draw()
{
  background(255);
  if(mousePressed)
  image(Img,820,620,100,100);
  else
  image(Img,800,600);
  ball1.sport();
  ball2.jump();
  noFill();
  }  
  
 