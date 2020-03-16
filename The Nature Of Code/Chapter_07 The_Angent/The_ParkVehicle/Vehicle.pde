class Vehicle
{
 ArrayList<Target> targets;
 PVector location ;
 PVector velocity;
 PVector acceleration;
 float maxSpeed;
 float maxForce;
 float angle;
 float r;
 int mark;
 Vehicle(Target []_target,float _maxSpeed,float _maxForce,float _r)
 {
    location = new PVector(random(0,width),random(0,height));
    velocity = new PVector(random(-10,10),random(-10,10));
    acceleration = new PVector();
    maxSpeed = _maxSpeed;
    maxForce = _maxForce;
    angle = 0;
    mark = 0;
    r= _r;
    setTarget(_target);
 }
  
  void applyForce(PVector force)
  {
    PVector f = force;
    acceleration.add(f);
  }
  
  void display()
  {
    angle = velocity.heading2D()+PI/2;
    fill(250,0,0);
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
    PVector targetPosition = targets.get(mark).location;
    PVector desired = PVector.sub(targetPosition,location);
    float distance = desired.mag();
    if(mark!=targets.size()-1)
    {
      desired.normalize();
      desired.mult(maxSpeed);
    }else{
       if(distance<100)
       {
           float m = map(distance,0,100,0,maxSpeed);
           desired.setMag(m);
       }
    }
    PVector steer = PVector.sub(desired,velocity);
    steer.limit(maxForce);
    applyForce(steer);
    if(distance<10&&mark!=targets.size()-1)
    mark++;
  }
  
  void update()
  {
    velocity.add(acceleration);
    velocity.limit(maxSpeed);
    location.add(velocity);
    acceleration.mult(0);
  }
  
  void setTarget(Target[] _target)
  {
    targets = new ArrayList<Target>();
    for(int i = 0;i<_target.length;i++)
    {
       targets.add(_target[i]); 
    }
    mark = 0;
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