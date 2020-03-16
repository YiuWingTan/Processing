class Vehicle
{
  Perceptron brain;
  PVector location;
  PVector velocity;
  PVector acceleration;
  PVector[]forces;
  float maxSpeed;
  float maxForce;
  float r;
  
  Vehicle(float _r,float _maxSpeed,float _maxForce)
  {
      r = _r;
      brain = new Perceptron(targets.length,0.001);
      location = new PVector(random(0,width),random(0,height));
      velocity = new PVector();
      acceleration = new PVector();
      maxSpeed = _maxSpeed;
      maxForce = _maxForce;
  }
  
  void run()
  {
     steer(); 
     update();
     display();
  }
  
  void display()
  {
      float theta = velocity.heading2D() + PI/2;
    fill(175);
    stroke(0);
    strokeWeight(1);
    pushMatrix();
    translate(location.x,location.y);
    rotate(theta);
    beginShape();
    vertex(0, -r*2);
    vertex(-r, r*2);
    vertex(r, r*2);
    endShape(CLOSE);
    popMatrix();
  }
  
  
  void steer()
  {
      forces = new PVector[targets.length];
      for(int i = 0;i<targets.length;i++)
      {
          forces[i] = seek(targets[i].location);
      }
      PVector sum = brain.feedforward(forces);
      
      applyForce(sum);
      
      PVector d = new PVector(width/2,height/2);
      PVector error = PVector.sub(d,location);
      brain.train(forces,error);
  }
  
  PVector seek(PVector loc)
  {
      PVector desired = PVector.sub(loc,location);
      
      desired.normalize();
      desired.mult(maxSpeed);
      
      PVector turnForce = PVector.sub(desired,velocity);
      
      turnForce.limit(maxForce);
      return turnForce;
  }
  
  void update()
  {
    velocity.add(acceleration);
    velocity.limit(maxSpeed);
    location.add(velocity);
    
    acceleration.mult(0);
    location.x = constrain(location.x,0,width);
    location.y = constrain(location.y,0,height);
  }
  
  void applyForce(PVector force)
  {
    PVector f = force.get();
    
    acceleration.add(f);
  }
  
  
}