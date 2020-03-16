class Mover
{
 float mass;
 PVector location;
 PVector velocity;
 PVector acceleration;
 
 Mover()
 {
   mass = random(1,3);
   location = new PVector(width/2+random(-width/2,width/2),height/2);
   velocity = new PVector(0,0);
   acceleration = new PVector(0,0);
 }
 
 void setp()
 {
   velocity.add(acceleration);
   velocity.limit(15);
   location.add(velocity);
 }
 
 void ApplyForce(PVector force)
 {
   PVector f = PVector.div(force,mass);
   acceleration.add(f);
 }
 
 void display()
 {
   fill(0);
   ellipse(location.x,location.y,mass*16,mass*16);
   acceleration.mult(0);
 }
 
 void CheckEdge()
 {
   if(location.x<0+(mass*16)/2)
   {
     velocity.x*=-1;
     location.x = 0+(mass*16)/2;
   }else if(location.x>width-(mass*16)/2)
   {
     velocity.x*=-1;
     location.x = width-(mass*16)/2;
   }
   
   if(location.y<0+ (mass*16)/2)
   {
     velocity.y*=-1;
     location.y = 0 + (mass*16)/2;
   }else if(location.y>height- (mass*16)/2)
   {
     velocity.y*=-1;
     location.y = height - (mass*16)/2;
   }
 }
}