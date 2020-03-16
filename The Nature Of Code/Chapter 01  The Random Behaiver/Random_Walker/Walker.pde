class Walker
{
  float x;
  float y;
 Walker()
 {
    x = width/2;
    y = height/2;
 }
 
 void step()
 {
   float rangeX = random(0,1);
   float rangeY = random(0,1);
   if(rangeX<0.6)
   {
      x=x+1;
     
   }else 
   {
      x = x-1; 
   }
   
   if(rangeY<0.6)
   {
      y=y+1; 
   }else
   {
      y =y-1;
   }
 }
 
 
 void display()
 {
   background(255);
   smooth();
   fill(0);
   ellipse(x,y,10,10);
 }
  
  
}