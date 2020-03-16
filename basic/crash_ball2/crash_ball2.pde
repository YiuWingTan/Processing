float x1,y1;
float dirationx;
float dirationy;
float speedx;
float speedy;
float r=80;
crash_ball []ball=new crash_ball[50];
void setup()
{
  size(1500,800);
  for(int i=0;i<=ball.length-1;i++)
  {
    x1=random(40,1459);
    y1=random(40,759);
    speedx=random(1,15);
    speedy=random(1,15);
    dirationx=1;
    dirationy=1;
    ball[i]=new crash_ball(x1,y1,speedx,speedy,dirationx,dirationy);
  }
}
void draw()
{
  background(0);
     for(int i=0;i<=ball.length-1;i++)
     {
       ball[i].step();
       ball[i].move();
     }
}
  
  