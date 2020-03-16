class Plane
{
  particalSystem []systems = new particalSystem[2];
  boolean speedUp;
  float setOffX,setOffY;
  float mass;
  float angle;
  PVector acceleration;
  PVector location;
  PVector velocity;
  
  Plane()
  {
    mass = random(2,8);
    setOffY = 100;
    setOffX = 100;
    location = new PVector(width/2,height/2);
    velocity = new PVector(0,0);
    acceleration = new PVector(0,0);
    angle = 0;
    for(int i =0;i<2;i++)
    {
      systems[i] = new particalSystem(location);
    }
    systems[0].reSetLocation(new PVector(15,30));
    systems[1].reSetLocation(new PVector(-10,30));
  }
  
  void ForceDeal(PVector force)
  {
    PVector f = PVector.div(force,mass);
    acceleration.add(f);
  }
  
  void applyFriction()
  {
    float c = 0.1;
    float v = velocity.mag();
    PVector firction = velocity.get();
    firction.normalize();
    firction.mult(-v*v*c);
    ForceDeal(firction);
  }
  //apply the firction on the plane when it is moving
  
  void ControllThePlane()
  {
    if(keyPressed)
    {
     if(key=='a')
     {
       angle-=0.02;
       
     }
     if(key=='d')
     {
       angle+=0.02;
       
     }
     if(key=='z')
     {
       float vangle = (PI*3)/2-angle;
       float x = cos(vangle);
       float y = sin(vangle);
       PVector direction = new PVector(-x,y);
       direction.normalize();
       direction.mult(2);
       acceleration.add(direction);
       // attention please
     }
    }
  }
  
  void Update()
  {
    velocity.add(acceleration);
    location.add(velocity);
    acceleration.mult(0);
  }
  //controller the angle
  void Display()
  {
    background(255);
    strokeWeight(3);
    pushMatrix();
    translate(location.x,location.y);
    rotate(angle);
    triangle(0-20,0+30,0,0,0+20,0+30);
    strokeWeight(2);
    rect(-15,30,5,5);
    rect(10,30,5,5);
    for(int i=0;i<2;i++)
    {
       systems[i].run(velocity); 
    }
    popMatrix();
  }
  
  void CheckEdge()
  {
    if(location.x>width+setOffX)
    {
     location.x = 0-setOffX; 
    }
    if(location.x<0-setOffX)
    {
     location.x = width+setOffX; 
    }
    
    if(location.y<0-setOffY)
    {
     location.y = height+setOffY; 
    }
    if(location.y>height+setOffY)
    {
     location.y = 0-setOffY; 
    }
  }
}