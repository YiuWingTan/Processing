class Boid
{
  PVector location;
  PVector acceleration;
  PVector velocity;
  int state;
  int[]record;
  float r;
  float maxSpeed;
  float maxForce;
  float seperDistance;
  float alignDistance;
  float coheDistance;
  float time;
  color col;
  
  
  Boid(float _r,float _maxSpeed,float _maxForce,float _sperDistance,float _alignDistance,float _coheDistance)
  {
    state = 0;
    r = _r;
    maxSpeed = _maxSpeed;
    maxForce = _maxForce;
    seperDistance = _sperDistance;
    alignDistance = _alignDistance;
    coheDistance = _coheDistance;
    location = new PVector(random(50,width-50),random(50,height-50));
    velocity = new PVector(random(-15,15),random(-15,15));
    acceleration = new PVector();
    record = new int[3];
    time = 0;
    col = color(0,0,0);
    setRecord();
  }
  
  void setRecord()
  {
     for(int i = 0;i<3;i++)
     record[i] = -1;
  }
  
  void setState(boolean direction)
    {
      if(direction)
      {
        maxSpeed = 8;
        maxForce*=3;
        state = 1;
        time = 10;
        col = color(255,0,0);
        println("change");
        setRecord();
      }else
      {
          maxSpeed = 4;
          maxForce/=3;
          state = 0;
          time = 0;
          col = color(0,0,0);
          println("record");
      }
    }
  
  void run(ArrayList<Boid>boids)
  {
      update();
      display();
      folck(boids);
      Edge();
      spendTime();
  }
  
  void folck(ArrayList<Boid>boids)
  {
      PVector sep = seperate(boids);
      PVector alig = align(boids);
      PVector coh = cohesion(boids);
      
      sep.mult(2.5);
      coh.mult(1.0);
      alig.mult(1.0);
      
      applyForce(sep);
      applyForce(alig);
      applyForce(coh);
  }
  
  PVector seperate(ArrayList<Boid>boids)
  {
    PVector sum = new PVector();
    int count = 0;
    
    for(Boid b:boids)
    {
       float distance = PVector.dist(b.location,location);
       if(distance<seperDistance&&distance>0)
       {
           PVector d = PVector.sub(location,b.location);
           d.normalize();
           sum.add(d);
           count++;
       }
    }
    
    if(count>0)
    {
       sum.div(count);
       sum.normalize();
       sum.mult(maxSpeed);
       
       PVector turnForce = PVector.sub(sum,velocity);
       turnForce.limit(maxForce);
       return turnForce;
    }
    
    return sum;
  }
  
  PVector align(ArrayList<Boid>boids)
  {
    PVector sum = new PVector();
    int count = 0;
    
    for(Boid b:boids)
    {
       float dist = PVector.dist(location,b.location);
       if(dist>0&&dist<alignDistance)
       {
          sum.add(velocity);
          count++;
       }
    }
    
    if(count>0)
    {
       sum.normalize();
       sum.mult(maxSpeed);
       PVector dir = PVector.sub(sum,velocity);
       dir.limit(maxForce);
       return dir;
    }
    
    return sum;
  }
  
  PVector cohesion(ArrayList<Boid>boids)
  {
    PVector sum = new PVector();
    int count = 0;
    
    for(Boid b:boids)
    {
        float dist = PVector.dist(location,b.location);
        if(coheDistance>dist&&dist>0)
        {
            sum.add(b.location);
            count++;
        }
    }
    
    if(count>0)
    {
      sum.div(count);
      PVector dir = PVector.sub(sum,location);
      dir.normalize();
      dir.mult(maxSpeed);
      PVector turnForce = PVector.sub(dir,velocity);
      turnForce.limit(maxForce);
      return turnForce;
    }
    return sum;
  }
  
  void display()
  {
   float angle = velocity.heading2D()+radians(90);
    
    fill(col);
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
  
  void Edge()
  {
    if(location.x>width+10) location.x = 0;
    if(location.x<-10) location.x = width;
    if(location.y>height+10) location.y = 0;
    if(location.y<-10) location.y = height;
  } 
    
    
  void spendTime()
  {
     if(state==1)
     {
         time-=0.01;
         col = lerpColor(color(0,0,0),color(255,0,0),map(time,0,10,0,1));
         if(time<0) setState(false);
     }
  }
}