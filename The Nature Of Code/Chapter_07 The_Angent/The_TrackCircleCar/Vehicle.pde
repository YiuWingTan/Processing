class Vehicle
{
 Target target;
 PVector location ;
 PVector velocity;
 PVector acceleration;
 float maxSpeed;
 float maxForce;
 float angle;
 float r;
 Vehicle(Target _target,float _maxSpeed,float _maxForce,float _r)
 {
    location = new PVector(random(0,width),random(0,height));
    velocity = new PVector(random(-10,10),random(-10,10));
    acceleration = new PVector();
    angle = 0;
    target = _target;
    r= _r;
    maxSpeed = _maxSpeed;
    maxForce = _maxForce;
 }
  
  void applyForce(PVector force)
  {
    PVector f = force;
    acceleration.add(f);
  }
  
  void display()
  {
    angle = velocity.heading2D()+PI/2;
    fill(0);
    pushMatrix();
    translate(location.x,location.y);
    rotate(angle);
    beginShape();
    vertex(0,-r*2);
    vertex(-r,r*2);
    vertex(r,r*2);
    endShape(CLOSE);
    popMatrix();
    noFill();
    
  }
  
  void seek()
  {
    PVector desired = PVector.sub(target.point,location);
    desired.normalize();
    desired.mult(maxSpeed);
    PVector turnForce = PVector.sub(desired,velocity);
    turnForce.limit(maxForce);
    
    applyForce(turnForce);
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
  void move()
  {
    seek();
    update();
    display();
    isOutSide();
  }
}