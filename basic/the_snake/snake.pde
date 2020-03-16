class snake
{
  PVector location;
  ArrayList<ball> body;
  ArrayList<mark>mark;
  snake()
  {
    location=new PVector(random(100,displayWidth),random(100,displayHeight));
    body=new ArrayList<ball>();
    mark=new ArrayList<mark>();
    body.add(new ball(location.x,location.y));
  }
  //judge the add tail diration
  void addTail()
  {
    PVector check=body.get(body.size()-1).speed;
    PVector mlocation=body.get(body.size()-1).location;
    if(check.x==0)
    {
      if(check.y>0) body.add(new ball(mlocation.x,mlocation.y-80));
      else
      body.add(new ball(mlocation.x,mlocation.y+80));
    }
    else
    {
      if(check.x>0)body.add(new ball(mlocation.x-80,mlocation.y));
      else body.add(new ball(mlocation.x+80,mlocation.y));
    }
  }
  
  void sport()
  {
    turndiration();
    isdead();
    
  }
  void iseat(food food)
  {
    float dist =PVector.dist(body.get(0).location,food.location);
    PVector klocation;
    if(dist<=40)
    {
      addTail();
      boolean good=false;
      while(!good)
      {
        for(int i=0;i<body.size()&&!good;i++)
        {
         ball p=body.get(i);
         klocation =new PVector(random(40,width),random(40,height));
         float d= PVector.dist(klocation,p.location);
         if(d>=40)
         good=true;
        }
      }
      food.location=klocation;
    }
  }
  
 //deal with the turn diration of the snake
  void turndiration()
  {
    
  }
  //add the turn mark into the markList
  void addmark()
  {
    if(key == CODED&&keyCode =='W')
  {
    mark.add(new mark(body.get(0).location,0,-8));
  }
  else
  if(key == CODED&&keyCode =='S')
  {
    mark.add(new mark(body.get(0).location,0,8));
  }
  else
  if(key == CODED&&keyCode =='A')
  {
    mark.add(new mark(body.get(0).location,-8,0));
  }
  else
  if(key == CODED&&keyCode =='D')
  {
    mark.add(new mark(body.get(0).location,8,0));
  }
  }
  
  boolean isdead()
  {
    return false;
  }
}