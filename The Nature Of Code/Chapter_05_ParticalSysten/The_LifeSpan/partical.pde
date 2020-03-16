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
   velocity = new PVector(random(-3,3),0);
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
 
 void Display()
 {
   strokeWeight(2);
   stroke(0,lifeSpan);
   fill(175,lifeSpan);
   ellipse(location.x,location.y,8,8);
   noFill();
 }
 
 boolean isDead()
 {
    if(lifeSpan<=0||location.y>height+4||location.y<4)
      return true;
    else 
      return false;  
 }
}