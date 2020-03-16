nature_ball []ball=new nature_ball[20];
float x,y;
PVector wind= new PVector(0.02,0);
PVector gratity=new PVector(0,0.98);
void setup()
{
  size(1500,900);
  fill(0);
  noStroke();
  smooth();
  for(int i=0;i<=ball.length-1;i++)
  {
   ball[i]=new nature_ball(0,0); 
  }
}
void draw()
{
  for(int i=0;i<=ball.length-1;i++)
  {
    ball[i].force(wind,gratity);
    ball[i].move_speedandlocation();
     ball[i].check();
    ball[i].show();
   
  }
}