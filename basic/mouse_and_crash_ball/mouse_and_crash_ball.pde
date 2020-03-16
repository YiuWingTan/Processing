crash_ball []ball=new crash_ball[20];
float r=80;
void setup()
{
  size(1500,800);
  smooth();
  for(int i=0;i<=ball.length-1;i++)
  {
    ball[i]=new crash_ball(random(40,1459),random(0,759),random(2,5),random(5,9));
  }
  fill(0);
}
void draw()
{
  background(255);
  for(int i=0;i<=ball.length-1;i++)
  {
    ball[i].step();
    ball[i].show();
  }
}