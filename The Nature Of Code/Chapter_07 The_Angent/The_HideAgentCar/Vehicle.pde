class Vehicle
{
  Barrier barrier;
 PVector location;
 PVector velocity;
 PVector acceleration;
 float angle;
 float r;
 float maxSpeed;
 float maxForce;
 
 
 Vehicle(Barrier _barrier,float _maxSpeed,float _maxForce,float _r)
 {
     barrier = _barrier;
     r = _r;
     maxSpeed = _maxSpeed;
     maxForce = _maxForce;
     location = new PVector(width,height/2);
     velocity = new PVector(-10,0);
     acceleration = new PVector();
     angle = 0;
     
 }
 
 void move()
 {
   hide();
   update();
   display();
   isOutSide();
 }
 
 void display()
 {
   angle = velocity.heading2D()+PI/2;
   fill(150);
   pushMatrix();
   translate(location.x,location.y);
   rotate(angle);
   beginShape();
   vertex(0, -r*2);
   vertex(-r, r*2);
   vertex(r, r*2);
   endShape(CLOSE);
   popMatrix();
   noFill();
 }
 
 void hide()
 {
   float setOff = 0;
   int number = barrier.barrier.size();
   PVector force = new PVector();
   for(int i = 0;i<number;i++)
   {
     PVector target = barrier.barrier.get(i);
     PVector desired = PVector.sub(target,location);
     float distance = desired.mag();
     distance = constrain(distance,25,100);
     println(distance);
     // the Length of the target to the vehicle
     
     desired.normalize();
     desired.mult(maxSpeed);
     
     PVector turnForce = PVector.sub(desired,velocity);
     turnForce.y*=-1;
     setOff = 1/distance;
     turnForce.mult(setOff);
     force.add(turnForce);
   }
   force.normalize();
   force.mult(maxForce);
   applyForce(force);
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
 }
 
 void isOutSide()
 {
    if(location.x<-50||location.x>width+50)
    {
      velocity.x = -velocity.x;
    }
     
     if(location.y<-50||location.y>height+50)
     {
       velocity.y = -velocity.y;
     }
 }
  //Set the Bounde of the game
}