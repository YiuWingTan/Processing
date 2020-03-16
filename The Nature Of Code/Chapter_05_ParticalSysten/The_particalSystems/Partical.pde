class partical
{
 PVector location;
 PVector velocity;
 PVector acceleration;
 float spanVelocity;
 float lifeSpan;
 
 partical(PVector l)
 {
   location = l.get();
   velocity = new PVector(random(-3,3),random(-5,5));
   acceleration = new PVector();
   lifeSpan = 250;
   spanVelocity = random(1,3);
 }
 
 void applyForce(PVector force)
 {
   PVector f = force.get();
   acceleration.add(f);
 }
 
 void update()
 {
   velocity.add(acceleration);
   location.add(velocity);
   acceleration.mult(0);
   lifeSpan-=spanVelocity;
 }
 
 void Display(int c)
 {
   strokeWeight(2);
   stroke(0,lifeSpan);
   fill(175,lifeSpan,c);
   ellipse(location.x,location.y,8,8);
   noFill();
 }
 
 boolean isDead()
 {
    if(location.x>Data.Edge.x+4||location.x<-4)
    return true;
    if(lifeSpan<=0||location.y>Data.Edge.y+4||location.y<4)
      return true;
    else 
      return false;  
 }
}