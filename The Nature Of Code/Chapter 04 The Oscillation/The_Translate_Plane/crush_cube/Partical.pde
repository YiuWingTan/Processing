class Partical
{
  float r;
  PVector location;
  PVector velocity;
  PVector acceleration;
  
  Partical(PVector loca)
  {
   r = 8;
   location = loca.get();
   velocity = new PVector();
   acceleration = new PVector();
  }
  
  void applyForce(PVector force)
  {
    PVector f = force.get();
    acceleration.add(f);
  }
  
  void display()
  {
    strokeWeight(2);
    stroke(0);
    fill(0);
    ellipse(location.x,location.y,2,2);
    noFill();
  }
  
  void update()
  {
    velocity.add(acceleration);
    location.add(velocity);
    acceleration.mult(0);
  }
  
  boolean isDead()
  {
    if(location.x>Force.edgeX+r/2||location.x<-r/2)
    {
      return true;
    }else if(location.y>Force.edgeY+r/2||location.y<-r/2)
    {
      return true;
    }
    return false;
  }
  
  boolean run()
  {
    applyForce(Force.gravity);
    update();
    display();
    if(isDead())
    {
      return true;  
    }
    return false;
  }
}