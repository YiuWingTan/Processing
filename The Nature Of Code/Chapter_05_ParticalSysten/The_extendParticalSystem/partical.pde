class partical
{
  
  PVector location;
  PVector velocity;
  PVector acceleration;
  float lifeSpan;
  
  partical(PVector loa)
  {
    location = loa.get();
    velocity = new PVector(random(-3,3),random(-3,3));
    acceleration = new PVector();
    lifeSpan = 800;
  }
  
  void update()
  {
    velocity.add(acceleration);
    location.add(velocity);
    acceleration.mult(0);
    lifeSpan -=5;
  }
  
  void applyForce(PVector force)
  {
    PVector f = force.get();
    acceleration.add(f);
  }
  
  void display()
  {
    
  }
  
  boolean isDead()
  {
     if(lifeSpan<=0)
     {
        return true;   
     }
     if(location.x>Data.Edge.x+4||location.x<-4)
     {
        return true; 
     }
     if(location.y>Data.Edge.y+4||location.y<-4)
     {
        return true; 
     }
     return false;
  }
}