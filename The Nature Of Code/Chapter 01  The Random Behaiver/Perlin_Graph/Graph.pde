class Graph
{
  float x;
  float y;
  float mark;
  Graph()
  {
    y = x = 0;
    mark = 0;
  }
  
  void display()
  {
    background(255);
    while(x<width)
    {
      mark+=0.1;
      fill(0);
      y = noise(mark);
      y = map(y,0,1,0,height);
      point(x,y);
      x+=0.01;
    }
  }
}