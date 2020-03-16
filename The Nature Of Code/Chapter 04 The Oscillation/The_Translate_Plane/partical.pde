class Partical
{
  PVector location;
  PVector velocity;
  PVector accelerity;
  float lifeSpan;
  float deadSpeed;
  float r;
  
  Partical(PVector loca)
  {
    location = loca.get();
    velocity = new PVector(0,0);
    accelerity = new PVector();
    lifeSpan = 250;
    deadSpeed = 50;
    r = random(2,4);
  }
  
  boolean run(PVector v)
  {
    
    //applyForce(Data.gravity);
    update(v);
    display();
    if(isDead())
      return true;
    else
      return false;
  }
  
  void applyForce(PVector force)
  {
    PVector f = force.get();
    accelerity.add(f);
  }
  
  void update(PVector v1)
  {
    velocity = v1.get();
    velocity.mult(-0.5);
    location.add(velocity);
    lifeSpan-=deadSpeed;
    accelerity.mult(0);
  }
  
  void display()
  {
    strokeWeight(2);
    stroke(0,lifeSpan);
    fill(200,lifeSpan);
    ellipse(location.x,location.y,r*2,r*2);
    noFill();
  }
  
  boolean isDead()
  {
    if(lifeSpan<=0)
    return true;
    return false;
  }
  
  
}