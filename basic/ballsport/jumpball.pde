float y1;
class jumpball
{
  float x1;
  int move2=1;
  float w,h,speed3=9;
  jumpball(float x1_,float y1_,float w_,float h_)
  {
    x1=x1_;
    y1=y1_;
    w=w_;
    h=h_;
  }
  void jump()
   {
     
     if(n%2==0&&n1%2==0)//jump or not jump
     
     {            
      if(y1>=460||y1<=230) //control up and down
         move2*=-1;        //control up and down     
         y1=y1+speed3*move2;
         
     }
     if(y1>=460)
         n1++;
         fill(0);
     rect(x1,y1,80,80);
   }
   
}