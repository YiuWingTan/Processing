ball []ball_=new ball[20];
float r=80;
float x,y;
float speedx,speedy;
void setup()
{
 size(1500,800);
 for(int i=0;i<=ball_.length-1;i++)
 {
   x=random(40,1459);
   y=random(40,759);
   speedx=random(10);
   speedy=random(5*2);
   ball_[i]=new ball(x,y,speedx,speedy,r);
 }
 smooth();
 fill(0);
}
void draw()
{
 background(255);
 for(int i=0;i<=ball_.length-1;i++)
 {
   ball_[i].step();
   ball_[i].show();
 }
}