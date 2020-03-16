WalkerBall baller;
void setup()
{
  size(1000,800);
  baller = new WalkerBall(2,3,0.05,0.03);
}

void draw()
{
  baller.Update();
  baller.display();
  baller.CheckEdge();
}
/*
void keyPressed()
{
  if(key==CODED)
  {
    if(keyCode==UP)
  {
    baller.acceleration.x = 0.05;
    baller.acceleration.y = 0.03;
  }
  
  if(keyCode==DOWN)
  {
    baller.acceleration.x = -0.05;
    baller.acceleration.y = -0.03;
  }
  }
  
}*/