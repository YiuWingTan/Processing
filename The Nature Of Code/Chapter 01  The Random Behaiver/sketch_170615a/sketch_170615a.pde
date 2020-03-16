float setOffZ;
void setup()
{
  size(1000,800);
  //noLoop();
  setOffZ = 0.0;
}

void draw()
{
  setOffZ+=0.02;
  background(0);
  loadPixels();
  float setOffX = 0.0;
  for(int x = 0;x<width;x++)
  {
    setOffX+=0.01;
    float setOffY = 0.0;
    //float setOffZ = 10000;
   for(int y = 0;y<height;y++)
   {
     setOffY+=0.01;
     //setOffZ+=0.02;
     float bright = map(noise(setOffX,setOffY,setOffZ),0,1,0,255);
     pixels[x+y*width] = color(bright);
  
   }
   updatePixels();
  }
}