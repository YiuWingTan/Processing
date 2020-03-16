nature_ball []ball=new nature_ball[20];
PVector wind= new PVector(0.2,0);
PVector gratity=new PVector(0,0.98);
float j=1;
void setup()
{
  size(1500,900);
  
  noStroke();
  smooth();
  for(int i=0;i<=ball.length-1;i++)
  {
   ball[i]=new nature_ball(80); 
  }
}
void draw()
{
  background(255);
  for(int i=0;i<=ball.length-1;i++)
  {
    fill(0);
    ball[i].force(wind,gratity);
    ball[i].move_speedandlocation();
    ball[i].check();
    ball[i].show();
   }
}