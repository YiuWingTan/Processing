class Vehicle
{
  PVector location;
  PVector velocity;
  PVector acceleration;
  
  float x;
  float y;
  float minDistance;
  float maxSpeed;
  float maxForce;
  float r;
  
  Vehicle(float _r,float _maxSpeed,float _maxForce,float _minDistance)
  {
    location = new PVector(random(50,width-50),random(50,height-50));
    velocity = new PVector(random(-15,15),random(-15,15));
    acceleration = new PVector();
    minDistance = _minDistance;
    maxSpeed = _maxSpeed;
    maxForce = _maxForce;
    r = _r;
    x = random(0,100);
    y = random(1000,2000);
  }
  
  void run()
  {
    update();
    display();
  }
  
  void display()
  {
    float angle = velocity.heading2D()+radians(90);
    
    fill(100);
    pushMatrix();
    translate(location.x,location.y);
    rotate(angle);
    beginShape(TRIANGLES);
    vertex(0, -r*2);
    vertex(-r, r*2);
    vertex(r, r*2);
    endShape();
    popMatrix();
    noFill();
  }
  
  void applyBehaviors(ArrayList<Vehicle> vehicles)
  {
    PVector separate = separate(vehicles);
    
    PVector seek = seek(new PVector(mouseX,mouseY));
    
    float offX = map(noise(x),0,1,0.5,2.5);
    float offY = map(noise(y),0,1,0.2,1.5);
    
    separate.mult(offX);
    seek.mult(offY);
    
    applyForce(separate);
    applyForce(seek);
    
    x+=0.01;
    y+=0.01;
  }
  
  PVector seek(PVector target)
  {
    PVector desired = PVector.sub(target,location);
    
    desired.normalize();
    desired.mult(maxSpeed);
    
    PVector turnForce = PVector.sub(desired,velocity);
    turnForce.limit(maxForce);
    return turnForce;
  }
  
  PVector separate(ArrayList<Vehicle> vehicles)
  {
    PVector sum = new PVector();
    int count = 0;
    
    for(Vehicle v:vehicles)
    {
       PVector d = PVector.sub(location,v.location); 
       
       float distance = d.mag();
       if(distance>0&&distance<minDistance)
       {
          d.normalize();
          sum.add(d);
          count++;
       }
    }
    
    PVector dir = new PVector();
    if(count>0)
    {
       sum.div(count);
       sum.normalize();
       sum.mult(maxSpeed);
       
       dir = PVector.sub(sum,velocity);
       dir.limit(maxForce);
    }
    return dir;
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
  
  
}