class Vehicle
{
  PVector location;
  PVector velocity;
  PVector acceleration;
  PVector normalPoint;
  PVector perLocation;
  float r;
  float maxSpeed;
  float maxForce;
  
  Vehicle(float _maxSpeed,float _maxForce,float _r)
  {
    r = _r;
    maxSpeed = _maxSpeed;
    maxForce = _maxForce;
    startUp();
  }
  
  void run()
  {
    update();
    display();
    Edge();
  }
  
  void applyForce(PVector force)
  {
    PVector f = force.get();
    acceleration.add(f);
  }
  
  void update()
  {
    velocity.add(acceleration);
    velocity.limit(maxSpeed);
    location.add(velocity);
    acceleration.mult(0);
  }
  
  void seek(PVector target)
  {
    PVector desired = PVector.sub(target,location);
    desired.normalize();
    desired.mult(maxSpeed);
    
    PVector turnForce = PVector.sub(desired,velocity);
    turnForce.limit(maxForce);
    
    applyForce(turnForce);
  }
  
  void follow(Path p)
  {
    int number = p.paths.size();
    PVector v = velocity.get();
    v.normalize();
    v.mult(25);
    PVector perLoc = PVector.add(location,v);
    perLocation = perLoc.get();
    PVector pathLoc = null;
    float minDistance = 10000;
    for(int i = 0;i<number-1;i++)
    {
       PVector start = p.paths.get(i);
       PVector end = p.paths.get(i+1);
       PVector path = PVector.sub(end,start);
       PVector norPoint = p.getNormalPoint(perLoc,start,end);
       //println(norPoint.x,norPoint.y);
       if(norPoint.x>end.x||norPoint.x<start.x)
       continue;
       //check the normalPoint is on the path?
       
       
       float distance = PVector.dist(location,norPoint);
       if(distance<minDistance)
       {
          minDistance = distance;
          normalPoint = norPoint.get();
          pathLoc = path.get();
       }
       //check the point is smallest?
       
    }
    
    float distance = PVector.dist(location,normalPoint);
    if(distance>p.r&&normalPoint!=null&&pathLoc!=null)
    {
       pathLoc.normalize();
       pathLoc.mult(25);
       PVector target = PVector.add(pathLoc,normalPoint); 
       seek(target);
    }
  }
  
  void display()
  {
    float angle = velocity.heading2D()+radians(90);
    if(normalPoint!=null)
    {
      ellipse(normalPoint.x,normalPoint.y,5,5);
      ellipse(perLocation.x,perLocation.y,5,5);
      line(location.x,location.y,perLocation.x,perLocation.y);
      line(perLocation.x,perLocation.y,normalPoint.x,normalPoint.y); 
    }
    fill(0);
    pushMatrix();
    translate(location.x,location.y);
    rotate(angle);
    beginShape();
    vertex(0, -r*2);
    vertex(-r, r*2);
    vertex(r, r*2);
    endShape();
    popMatrix();
    
  }
  
  void Edge()
  {
    if(location.x>width||location.y>height)
    startUp();
  }
  
  void startUp()
  {
    float y = path.paths.get(0).y;
    location = new PVector(0,y);
    velocity = new PVector(random(5,20),random(-15,15));
    acceleration = new PVector();
    
  }
}