class ball
{
  PVector location;
  PVector speed;
  ball(float x,float y)
  {
    location=new PVector(x,y);
    speed=new PVector(8,0);
  }
  
  void update()
  {
    location.add(speed);
  }
  
  void display()
  {
    
  }
  void move()
  {
    update();
    display();
  }
}