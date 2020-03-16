class Vehicle
{
  PVector location;
  PVector velocity;
  PVector acceleration;
  float maxSpeed;
  float maxForce;
  float angle;
  float r;
  
  
  Vehicle(float _r,float _maxSpeed,float _maxForce)
  {
        
    velocity = new PVector();
    acceleration = new PVector();
    location = new PVector(width,random(0,height));
    maxSpeed = _maxSpeed;
    maxForce = _maxForce;
    angle = 0;
    r = _r;
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
  
  void display()
  {
    angle = velocity.heading2D() + radians(90);
    fill(175);
    stroke(0);
    pushMatrix();
    translate(location.x,location.y);
    rotate(angle);
    beginShape(TRIANGLES);
    vertex(0, -r*2);
    vertex(-r, r*2);
    vertex(r, r*2);
    endShape();
    popMatrix();
  }
  
  void follow( FlowField flowField)
  {
    PVector desired = flowField.lookup(location);
    desired.normalize();
    desired.mult(maxSpeed);
    
    PVector steer = PVector.sub(desired,velocity);
    steer.limit(maxForce);
    applyForce(steer);
  }
  
  boolean isDead()
  {
    if(location.x<-100||location.x>width+100)
    return true;
    return false;
  }
}