class Vehicle
{
  
  DNA dna;
  PVector location;
  PVector acceleration;
  PVector velocity;
  float r;
  int generCount;
  float fitness;
  float recordDistance;
  float finishTime;
  boolean hitTarget;
  boolean stop;
  
  
  Vehicle(DNA _dns,float _r)
  {
    hitTarget = false;
    recordDistance = 1000;
    finishTime = 0;
    stop = false;
    dna = _dns;
    generCount = 0;
    r = _r;
    location = new PVector(width/2,height/2);
    velocity = new PVector();
    acceleration = new PVector();
  }
  
  void run()
  {
    if(!stop)
    {
      applyForce(dna.genes[lifeCounter]);
      update();
      display();
      generCount++;
      checkRecordDistance();
       
      
      stop = obstacle.contains(location);
    }
    if(!hitTarget) {
        finishTime++;
        hitTarget = target.contains(location);
       }
  }
  
  void applyForce(PVector force)
  {
    PVector f = force.get();
    
    acceleration.add(f);
  }
  
  void update()
  {
      velocity.add(acceleration);
      acceleration.mult(0);
      location.add(velocity);
  }
  
  void checkRecordDistance()
  {
     float dist = PVector.dist(location,target.location);
     if(dist<recordDistance)
     {
        recordDistance = dist; 
     }
  }
  
  Vehicle crossover(Vehicle vehicleB)
  {
      DNA d = new DNA();
      //int n = (int)random(0,d.genes.length);
      for(int i = 0;i<d.genes.length;i++)
      {
         float p = random(1);
         if(p<0.5)
         d.genes[i] = dna.genes[i];
         else 
         d.genes[i] = vehicleB.dna.genes[i];
      }
      d.mutate();
      Vehicle child = new Vehicle(d,3);
      return child;
  }
  
  void fitness()
  {
      fitness = pow(1/recordDistance*finishTime,2);
      
      if(stop) fitness*=0.1;
      if(hitTarget&&!stop) fitness*=2;
  }
  
 
     void display() {
    float theta = velocity.heading2D() + PI/2;
    fill(200, 100);
    stroke(0);
    pushMatrix();
    translate(location.x, location.y);
    rotate(theta);

    // Thrusters
    rectMode(CENTER);
    fill(0);
    rect(-r/2, r*2, r/2, r);
    rect(r/2, r*2, r/2, r);

    // Rocket body
    fill(175);
    beginShape(TRIANGLES);
    vertex(0, -r*2);
    vertex(-r, r*2);
    vertex(r, r*2);
    endShape();

    popMatrix();
  }
}