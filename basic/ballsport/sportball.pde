class ball
{
 float x;
 float y;
 float r,r1;
 float speed,speed2=2.2;
 int diration=-1,n;
 int move=-1;
 float start,end;
 boolean press;
 ball(float x_,float y_,float r_,int speed_)
 {
   x=x_;
   y=y_;
   r=r_;
   speed=speed_;
}
  void sport()
 {
   if(x<=40||x>=959){
     n++;
   diration*=-1;}
   if(x<=40) {start=60;end=300;move=-1;}
      if(x>=959){start=240;end=480;move=-1;}
      if(n%2!=0&&(start<=2||start>60)){
      move*=-1;}
      if(n%2==0&&(start<=180||start>240)) move*=-1;
      start=start+speed2*move;
      end=end+speed2*(-move);
      x=x+speed*diration;
      fill(0);
   arc(x,y,r,r,radians(start),radians(end));
 }
   
   
}