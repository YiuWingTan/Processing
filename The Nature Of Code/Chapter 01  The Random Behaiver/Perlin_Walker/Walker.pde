class Walker
{
  float tx;
  float ty;
  float x;
  float y;
  Walker()
  {
    tx = 0;
    ty = 10000;
  }
  
  void display()
  {
    background(255);
    fill(0);
    ellipse(x,y,25,25);
  }
  
  void step()
  {
    x = noise(tx);
    y = noise(ty);
    x = map(x,0,1,0,width);
    y = map(y,0,1,0,height);
    tx+=random(0.01);
    ty+=random(0.01);
  }
}