class Mover
{
  PVector location;
  PVector velocity;
  PVector acceleration;
  float mass;
  
  Mover()
  {
    mass = random(2,5);
    velocity = new PVector(random(-10,10),random(-10,10));
    acceleration = new PVector(0,0);
    location =ChoiceLocation(); 
  }
  //initialize the data of mover
  PVector ChoiceLocation()
  {
    float distance = 0;
    PVector loca;
    do
    {
      loca = new PVector(random(0+mass*16/2,width-mass*16/2),random(0+mass*16/2,height-mass*16/2));
      distance = PVector.sub(loca,new PVector(width/2,height/2)).mag();
    }while(distance<=160+mass*16/2);
    return loca;
  }
  //create the location of mover
  
  void ApplyForce(PVector force)
  {
    PVector f = PVector.div(force,mass);
    acceleration.add(f);
  }
  
  void Update()
  {
    velocity.add(acceleration);
    velocity.limit(30);
    location.add(velocity);
  }
  
  void CheckEdge()
  {
    if(location.x<0+mass*16/2)
    {
      location.x = 0+mass*16/2;
      velocity.x*=-0.5;
    }else if(location.x>width-mass*16/2)
    {
      location.x = width-mass*16/2;
      velocity.x*=-0.5;
    }
    
    if(location.y<0+mass*16/2)
    {
      location.y = 0+mass*16/2;
      velocity.y*=-0.5;
    }else if(location.y>height-mass*16/2)
    {
      location.y = height - mass*16/2;
      velocity.y*=-0.5;
    }
  }
  
  void display()
  {
    //smooth(2);
    fill(0);
    ellipse(location.x,location.y,mass*16,mass*16);
    noFill();
    //noSmooth();
    acceleration.mult(0);
  }
  
  
}