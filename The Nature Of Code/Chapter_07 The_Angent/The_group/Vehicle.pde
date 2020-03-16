class Vehicle
{
   PVector location;
   PVector velocity;
   PVector acceleration;
   
   float r;
   float maxSpeed;
   float maxForce;
  
   Vehicle(float _maxSpeed,float _maxForce)
   {
     r = random(3,10);
     maxSpeed = _maxSpeed;
     maxForce = _maxForce;
     location = new PVector(random(0,width),random(0,height));
     velocity = new PVector(random(-20,20),random(-20,20));
     acceleration = new PVector();
   }
   
   void collect(ArrayList<Vehicle> vehicles)
   {
     float desiredcollection = 300;
     PVector sum = new PVector();
     int count = 0;
     
     for(Vehicle v:vehicles)
     {
       float d = PVector.dist(location,v.location);
       if(d>0&&d>desiredcollection)
       {
          PVector diff = PVector.sub(v.location,location);
          diff.normalize();
          sum.add(diff);
          count++;
       }
     }
     
     if(count>0)
     {
       sum.div(count);
       sum.normalize();
       sum.mult(maxSpeed);
       
       PVector steer = PVector.sub(sum,velocity);
       steer.limit(maxForce);
       applyForce(steer);
     }
     
     
   }
   
   void display()
   {
     // Draw a triangle rotated in the direction of velocity
     float theta = velocity.heading2D() + radians(90);
     fill(175);
    stroke(0);
    strokeWeight(3);
    pushMatrix();
    translate(location.x,location.y);
    rotate(theta);
    beginShape(TRIANGLES);
    vertex(0, -r*2);
    vertex(-r, r*2);
    vertex(r, r*2);
    endShape();
    popMatrix();
   }
   
   void update()
   {
     velocity.add(acceleration);
     velocity.limit(maxSpeed);
     location.add(velocity);
     acceleration.mult(0);
   }
   
   void applyForce(PVector force)
   {
     PVector f = force.get();
     acceleration.add(f);
   }
   
   void run()
   {
     update();
     display();
   }
   
}