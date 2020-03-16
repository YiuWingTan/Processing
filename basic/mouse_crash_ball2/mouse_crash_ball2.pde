mouse_ball []ball=new mouse_ball[20];
float x,y;
float r=80;
void setup()
{
  size(1500,900);
  smooth();
  for(int i=0;i<=ball.length-1;i++)
  {
    x=random(40,1459);
    y=random(40,859);
   ball[i]=new mouse_ball(x,y); 
  }
  fill(0);
}
void draw()
{
 background(255); 
 for(int i=0;i<=ball.length-1;i++)
 {
   ball[i].datejspeed();
   ball[i].sport();
   ball[i].show();
 }
}