class Boid
{
  PVector location;
  PVector velocity;
  PVector acceleration;
  
  float minDistance;
  float maxSpeed;
  float maxForce;
  float veiw;
  float r;
  int R,G,B;
  
  
  Boid(float _r,float _maxSpeed,float _maxForce,float _minDistance,float _veiw)
  {
    r = _r;
    veiw = _veiw;
    maxSpeed = _maxSpeed;
    maxForce = _maxForce;
    minDistance = _minDistance;
    location = new PVector(random(50,width-50),random(50,height-50));
    velocity = new PVector(random(-15,15),random(-15,15));
    acceleration = new PVector();
    R = (int)random(255);
    G = (int)random(255);
    B = (int)random(255);
  }
  
  void display()
  {
    float angle = velocity.heading2D()+radians(90);
    
    fill(11,200,123);
    stroke(0);
    //strokeWeight(2);
    pushMatrix();
    translate(location.x,location.y);
    rotate(angle);
    beginShape(PConstants.TRIANGLES);
    vertex(0, -r*2);
    vertex(-r, r*2);
    vertex(r, r*2);
    endShape();
    popMatrix();
    noFill();
  }
  
  void flock(ArrayList<Boid> boids)
  {
    PVector sep = separate(boids);
    
    PVector ali = align(boids);
    
    sep.mult(1.5);
    
    ali.mult(1.0);
    
    applyForce(sep);
    applyForce(ali);
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
  
  PVector separate(ArrayList<Boid> boids)
  {
    PVector sum = new PVector();
    int count = 0;
    
    for(Boid b:boids)
    {
       float distance = PVector.dist(location,b.location);
       
       if(distance>0&&distance<minDistance)
       {
          PVector d = PVector.sub(location,b.location);
          d.normalize();
          sum.add(d);
          count++;
       }
    }
    
    //PVector dir = new PVector();
    if(count>0)
    {
        sum.div(count);
        sum.normalize();
        sum.mult(maxSpeed);
        PVector dir = PVector.sub(sum,velocity);
        dir.limit(maxForce);
        return dir;
    }
    return new PVector();
  }
  
  PVector align(ArrayList<Boid> boids)
  {
    PVector sum = new PVector();
    int count = 0;
    
    for(Boid b:boids)
    {
       float distance = PVector.dist(location,b.location);
       PVector forn = PVector.sub(b.location,location);
       float angle = PVector.angleBetween(velocity,forn);
       if(distance>0&&distance<veiw&&angle<PI/4)
       {
         sum.add(b.velocity);
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
  
  void run()
  {
    update();
    display();
    Edge();
  }
  
  void Edge()
  {
     if(location.x>width||location.x<0)
     {
       velocity.x*=-1;
     }
     
     if(location.y>height||location.y<0)
     {
       velocity.y*=-1;
     }
  }
}