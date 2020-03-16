

void setup()
{
 size(1500,1000); 
 background(250);
 FractalShape(width/2,height/2,500);
}

void draw()
{
  
}

void FractalShape(float x,float y,float len)
{
  if(len>1)
  {
   line(x-len/2,y,x+len/2,y);
   line(x-len/2,y-len/2,x-len/2,y+len/2);
   line(x+len/2,y+len/2,x+len/2,y-len/2);
   FractalShape(x+len/2,y+len/2,len/2);
   FractalShape(x+len/2,y-len/2,len/2);
   FractalShape(x-len/2,y+len/2,len/2);
   FractalShape(x-len/2,y-len/2,len/2);
  }
  
}