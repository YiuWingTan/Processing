class crash_ball
{
  float x,y;
  float dirationx;
  float dirationy;
  float speedx;
  float speedy;
  crash_ball(float x_,float y_,float speedx_,float speedy_,float dirationx_,float dirationy_)
  {
    x=x_;
    y=y_;
    speedx=speedx_;
    speedy=speedy_;
    dirationx=dirationx_;
    dirationy=dirationy_;
  }
  
  void step()
  {
    
     if(x<40||x>1459)
     dirationx=-dirationx;
     if(y<40||y>759)
     dirationy=-dirationy;
      x+=speedx*dirationx;
      y+=speedy*dirationy;
     }
     
   void move()
   {
     ellipse(x,y,r,r);
   }
}