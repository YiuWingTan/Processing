
void setup()
{
  size(1000,800);
  noiseDetail(5);
  //noLoop();
}

void draw()
{
  loadPixels();
  float setOffx =0;
    for(int x=0;x<width;x++)
    {
      float setOffy = 0.0;
     for(int y=0;y<height;y++)
     {
       setOffy+=0.01;
       float bright = map(noise(setOffx,setOffy),0,1,0,255);
       pixels[x+y*width] = color(bright);
     }
     setOffx+=0.01;
    }
    updatePixels();
}