class WalkerBall
{
  PVector location;
  PVector velocity;
  PVector acceleration;
  WalkerBall(float _xspeed,float _yspeed,float _x,float _y)
  {
    location = new PVector(width/2,height/2);
    velocity = new PVector(_xspeed,_yspeed);
    acceleration = new PVector(_x,_y);
  }
  
  void CheckEdge()
  {
    if(location.x<0)
    {
      location.x = width;
    }else if(location.x>width)
    {
      location.x = 0;
    }
    //check the width Edge
    
    if(location.y>height)
    {
      location.y = 0;
    }else if(location.y<0)
    {
      location.y =height;
    }
    //check the height Edge
    
  }
  
  void Update()
  {
    velocity.add(acceleration);
    velocity.limit(10);
    location.add(velocity);
  }
  
  void display()
  {
    background(255);
    fill(0);
    ellipse(location.x,location.y,25,25);
  }
  
}