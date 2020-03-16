class Number
{
  PVector location;
  PVector acceleration;
  PVector velocity;
  float maxSpeed;
  float maxForce;
  float minDistance;
  PVector nor;
  float r;
  
  Number(float _maxSpeed,float _maxForce,float _minDistance)
  {
    minDistance = _minDistance;
    maxSpeed = _maxSpeed;
    maxForce = _maxForce;
    location = new PVector(100,100);
    acceleration = new PVector();
    velocity = new PVector(random(5,15),random(-5,5));
    r = random(3,8);
  }
  
  void update()
  {
    velocity.add(acceleration);
    velocity.normalize();
    velocity.mult(maxSpeed);
    location.add(velocity);
    acceleration.mult(0);
  }
  
  void applyForce(PVector force)
  {
    PVector f = force.get();
    acceleration.add(f);
  }
  
  void follow(FlowField flowField)
  {
    ArrayList<PVector> path = flowField.flowFields;
    int number = path.size();
    PVector v = velocity.get();
    v.normalize();
    v.mult(50);
    PVector predictpos = PVector.add(location,v);
    
    PVector normal = null;
    PVector target = null;
    
    float worldRecord = 1000000;
    for(int i = 0;i<number-1;i++)
    {
        PVector a = path.get(i);
        PVector b = path.get(i+1);
        
        PVector normalPoint = flowField.getNormalPoint(predictpos,a,b);
        
        if (normalPoint.x < min(a.x,b.x) || normalPoint.x > max(a.x,b.x) || normalPoint.y < min(a.y,b.y) || normalPoint.y > max(a.y,b.y)) 
        normalPoint = b.get();
        
        float distance = PVector.dist(predictpos,normalPoint);
        if(distance<worldRecord)
        {
           worldRecord = distance;
           normal = normalPoint.get();
           
           PVector dir = PVector.sub(b,a);
           dir.normalize();
           dir.mult(10);
           target = normalPoint.get();
           target.add(dir);
        }
    }
    nor = normal.get();
    
    if(worldRecord>flowField.r)
    {
       PVector desired = PVector.sub(target,location);
       desired.normalize();
       desired.mult(maxSpeed);
    
       PVector turnForce = PVector.sub(desired,velocity);
       turnForce.limit(maxForce);
    
       applyForce(turnForce);
    }
  }
  
  void separate(ArrayList<Number> vehicles)
  {
    PVector target = new PVector();
    int count = 0;
    for(Number v:vehicles)
    {
       float distance = PVector.dist(v.location,location);
       if(distance<minDistance)
       {
          PVector p = PVector.sub(location,v.location);
          p.normalize();
          target.add(p);
          count++;
       }
    }
    if(count>0)
    {
       target.div(count);
       target.normalize();
       target.mult(maxSpeed);
       
       PVector steer = PVector.sub(target,velocity);
       steer.limit(maxForce);
       applyForce(steer);
    }
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
    ellipse(nor.x,nor.y,5,5);
  }
  
  void run()
  {
     update();
     display();
  }
}