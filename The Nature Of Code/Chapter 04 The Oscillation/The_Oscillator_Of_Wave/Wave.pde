class Wave
{
  float startX;
  float endX;
  float setOff;
  float amplitude;
  float thera = 0;
  Wave(float _startX,float _endX,float _amplitude,float p)
  {
    startX = _startX;
    endX = _endX;
    amplitude = _amplitude;
    setOff = (TWO_PI/p)*8;
  }
  
  void Dispaly()
  {
    fill(0,50);
    strokeWeight(3);
    thera+=0.02;
    float dx = thera;
    for(float x = startX;x<endX;x+=25)
    {
      float y = sin(dx)*amplitude;
      ellipse(x,y+height/2,100,100);
      dx+=setOff;
    }
  }
  
}