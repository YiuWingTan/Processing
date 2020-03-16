class walker
{
 float x;
 float y;
 int n,speed;
  walker(float x_,float y_,int speed_)
  {
    x=x_;
    y=y_;
    speed=speed_;
  }
  void step()
  {
    n=int(random(8));
    if(n==0) y--;
    if(n==1) y=y+speed;
    if(n==2) x--;
    if(n==3) x=x+speed;
    if(n==4) {x--;y--;}
    if(n==5) {x=x+speed;y--;}
    if(n==6) {x--;y=y+speed;}
    if(n==7) {x=x+speed;y=y+speed;}
  }
  
 void random_walk() 
  {
    
   ellipse(x,y,80,80);
  }
}