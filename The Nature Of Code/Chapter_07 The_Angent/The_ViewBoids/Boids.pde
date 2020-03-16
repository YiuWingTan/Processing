class Boid
{
  PVector location;
  PVector velocity;
  PVector acceleration;
  
  float r;
  float maxSpeed;
  float maxForce;
  float minDistance;
  float viewAngle;
  
  Boid(float _r,float _maxSpeed,float _maxForce,float _minDistance,float _viewAngle)
  {
    r = _r;
    maxSpeed = _maxSpeed;
    maxForce = _maxForce;
    minDistance =  _minDistance;
    viewAngle = _viewAngle;
    location = new PVector(random(50,width),random(0,height));
    velocity = new PVector(random(-15,15),random(-15,15));
    acceleration = new PVector();
    
  }
  
  
  void run(ArrayList<Boid>boids)
  {
    //PVector coh = cohesion(boids);
    PVector sep = separate(boids);
    PVector avo = avoid(boids);
    
    sep.mult(1.5);
    //coh.mult(1.0);
    avo.mult(0.5);
    
    applyForce(sep);
    //applyForce(coh);
    applyForce(avo);
    
    update();
    
    display();
    
    Edge();
  }
  
  PVector cohesion(ArrayList<Boid>boids)
  {
    PVector sum = new PVector();
    int count = 0;
    
    for(Boid b:boids)
    {
       float distance = PVector.dist(location,b.location);
       
       if(distance>0&&distance<minDistance)
       {
          sum.add(b.location);
          count++;
       }
    }
    PVector turnForce  = new PVector();
    if(count>0)
    {
       sum.div(count);
       PVector desired = PVector.sub(sum,location);
       desired.normalize();
       desired.mult(maxSpeed);
       
       turnForce = PVector.sub(desired,velocity);
       turnForce.limit(maxForce);
       return turnForce;
    }
    return turnForce;
  }
  
  PVector avoid(ArrayList<Boid>boids)
  {
    PVector sum = null;
    float choiceAngle = 0;
    
    for(Boid b:boids)
    {
       PVector l = PVector.sub(b.location,location);
       float dist = l.mag();
       float angle = PVector.angleBetween(velocity,l);
       if(dist>0&&dist<100&&angle<viewAngle)
       {
           if(choiceAngle<angle)
           {
              choiceAngle = angle;
              PVector forn = l.get();
              float x,y;
              x = y = 1;
              if(forn.x==0) y = 0;
              else if(forn.y==0) x = 0;
              else{
                 y = -(forn.x/forn.y)*x; 
              }
              sum = new PVector(x,y);
              sum.normalize();
           }
       }
    }
    
    if(sum!=null)
    {
        sum.normalize();
        sum.mult(maxSpeed);
        PVector turnForce = PVector.sub(sum,velocity);
        turnForce.limit(maxForce);
        return turnForce;
    }
    return new PVector();
  }

  PVector separate(ArrayList<Boid> boids)
  {
    PVector sum = new PVector();
    int count = 0;
    
    for(Boid b:boids)
    {
       float distance = PVector.dist(location,b.location);
       
       if(distance>0&&distance<75)
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
  void display()
  {
    float angle = velocity.heading2D()+radians(90);
    
    fill(0);
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