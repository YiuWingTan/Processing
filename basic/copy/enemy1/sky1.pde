class sky
{
  float []x=new float [50];
  float []y=new float [50];
  sky()
  {
    for(int i=0;i<=x.length-1;i++)
    {
      x[i]=random(0,displayWidth);
      y[i]=random(0,displayHeight);
    }
  }
  void show_and_update()
  {
    background(0);
    fill(255);
   
    for(int i=0;i<=x.length-1;i++)
    {
     if(y[i]>height)
     {
       x[i]=random(0,displayWidth);
       y[i]=0;
     }
     else
     y[i]+=3;
     ellipse(x[i],y[i],3,3);
     
    }
    
  }
  
  
}