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
    velocity = new PVector(random(-3,3),0);
    accelerity = new PVector();
    lifeSpan = 250;
    deadSpeed = random(2,5);
    r = random(2,4);
  }
  
  boolean run()
  {
    applyForce(Data.gravity);
    update();
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
  
  void update()
  {
    velocity.add(accelerity);
    location.add(velocity);
    lifeSpan-=deadSpeed;
    accelerity.mult(0);
  }
  
  void display()
  {
    strokeWeight(2);
    stroke(0,lifeSpan);
    fill(20,lifeSpan,150);
    ellipse(location.x,location.y,r*2,r*2);
    noFill();
  }
  
  boolean isDead()
  {
    if(lifeSpan<=0)
    return true;
    if(location.x>Data.edgeX.x+r||location.x<-r)
    return true;
    if(location.y>Data.edgeY.x+r||location.y<-r)
    return true;
    return false;
  }
  
  
}