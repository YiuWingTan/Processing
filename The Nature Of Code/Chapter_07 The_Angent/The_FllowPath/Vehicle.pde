class Vehicle
{
  PVector  location;
  PVector velocity;
  PVector acceleration;
  PVector norPoint;
  PVector perLocation;
  Path path;
  float maxForce;
  float maxVelocity;
  float r;
  boolean isOutSide;
  
  Vehicle(Path _path,float _r,float _maxForce,float _maxVelocity)
  {
    startup();
    path = _path;
    maxForce = _maxForce;
    maxVelocity = _maxVelocity;
    r = _r;
  }
  
  void update()
  {
    velocity.add(acceleration);
    velocity.limit(maxVelocity);
    location.add(velocity);
    acceleration.mult(0);
  }
  
  void seek(PVector target)
  {
    PVector desired = PVector.sub(target,location);
    desired.normalize();
    desired.mult(maxVelocity);
    
    
    PVector turnForce = PVector.sub(desired,velocity);
    turnForce.limit(maxForce);
    applyForce(turnForce);
  }
  
  void follow()
  {
    PVector v = velocity.get().normalize();
    v.mult(50);
    PVector predictLoc = PVector.add(location,v);
    perLocation  = predictLoc;
    PVector pathLoc = PVector.sub(path.endPoint,path.startPoint);
    PVector normalPoint = path.getNormalPoint(predictLoc,pathLoc);
    norPoint = normalPoint.get();
    pathLoc.normalize();
    pathLoc.mult(10);
    PVector target = normalPoint.add(pathLoc).get();
    
    float distance = PVector.dist(normalPoint,predictLoc);
    if(distance>path.r)
    {
      seek(target);
      isOutSide = true;
    }
    else
    isOutSide = false;
  }
  
  void applyForce(PVector force)
  {
    PVector f = force.get();
    acceleration.add(f);
  }
  
  void display()
  {
    float angle = velocity.heading2D()+radians(90);
    fill(175);
    stroke(0);
    pushMatrix();
    translate(location.x,location.y);
    rotate(angle);
    beginShape(PConstants.TRIANGLES);
    vertex(0, -r*2);
    vertex(-r, r*2);
    vertex(r, r*2);
    endShape();
    popMatrix();
    
    if(isOutSide)
    {
      fill(250,0,0);      
    }
    else
    {
      fill(0);
    }
    ellipse(norPoint.x,norPoint.y,6,6);
    noFill();
    line(location.x,location.y,perLocation.x,perLocation.y);
    line(perLocation.x,perLocation.y,norPoint.x,norPoint.y);
  }
  
  void Edge()
  {
    if(location.x>width+50||location.y>height+50)
    {
      startup();
    }
  }
  
  void startup()
  {
    location = new PVector(0,random(0,height));
    velocity = new PVector(random(5,20),random(-15,15));
    acceleration = new PVector();
  }
  
  void move()
  {
    follow();
    update();
    display();
    Edge();
  }
}