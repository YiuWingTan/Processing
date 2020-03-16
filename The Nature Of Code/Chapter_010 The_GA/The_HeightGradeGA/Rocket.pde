class Rocket
{
   DNA dna;
  PVector location;
  PVector acceleration;
  PVector velocity;
  float fitness;
  float r;
  boolean stopOn1;
  boolean stopOn2;
  boolean onArea1;
  boolean onArea2;
  
  Rocket(DNA _dna,float _r)
  {
     stopOn1 = false;
     stopOn2 = false;
     onArea2 = false;
     onArea1 = false;
     dna = _dna;
     r = _r;
     location = new PVector(width/2,height/2);
     acceleration = new PVector();
     velocity = new PVector();
     fitness = 0;
   }
   
   void applyForce(PVector force)
   {
     PVector f = force.get();
     acceleration.add(f);
   }
   
   void update()
   {
      velocity.add(acceleration);
      location.add(velocity);
      acceleration.mult(0);
   }
   
   void run()
   {
     if(!stopOn1&&!stopOn2){
       applyForce(dna.genes[lifeCount]);
     
       update();
     
       display();
       
       
      
      if(location.x<obstacle[0].location.x+50&&location.x>obstacle[1].location.x){
        if(location.y>obstacle[1].location.y&&location.y<obstacle[0].location.y) 
          onArea1 = true;
       }
       //check the area one 
       if(location.y<obstacle[1].location.y){
         onArea2 = true;
       }
         
       stopOn1 = obstacle[0].contians(location);
       stopOn2 = obstacle[1].contians(location);
     }
     //check the area tow
   }
   
   void display()
   {
     float theta = velocity.heading2D() + PI/2;
    fill(200, 100);
    stroke(0);
    strokeWeight(1);
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
   
   void fitness1()
   {
     float distance = PVector.dist(location,target[1].location);
     float setoff = 1;
     
     if(stopOn1){
         setoff/=10;
     }
     
     if(stopOn2){
       setoff/=5;
     }
     
     if(onArea1) setoff*=10;
     if(onArea2) setoff*=50;
     
     //fitness = 1/bestDistance;
     fitness = 1/distance;
     fitness*=setoff;
   }
   
   void fitness2()
   {
       boolean setTarget = location.y>obstacle[1].location.y;   
       int mark = 0;
       
       if(setTarget) mark = 0;
       else mark = 1;
       
       float setoff = 1;
       float distance = PVector.dist(location,target[mark].location);
       
       if(stopOn1||stopOn2) setoff/=20;
       if(mark==1) setoff*=20;
       //if the target is the best 
       if(onArea1) setoff*=10;
       if(onArea2) setoff*=20;
       
       fitness = 1/(distance*distance);
       fitness*=setoff;
       //fitness = (1/distance)*setoff;
   }
   
   void mutating(float mutatingRate)
   {
     for(int i = 0;i<dna.genes.length;i++)
     {
       float p = random(0,1);
       if(p<mutatingRate)
       {
          dna.genes[i] = PVector.random2D(); 
          dna.genes[i].mult(random(dna.maxForce));
       }
     }
   }
   //make the rocket mutate
   
   Rocket mating1(Rocket partentB)
   {
     int mark = (int)random(dna.genes.length);
     DNA d = new DNA();
     for(int i = 0;i<lifeTime;i++)
     {
         if(i>mark) d.genes[i] = dna.genes[i];
         else d.genes[i] = partentB.dna.genes[i];
     }
     
     Rocket r = new Rocket(d,3);
     return r;
   }
   
   
   Rocket mating2(Rocket partentB)
   {
     DNA d = new DNA();
     for(int i = 0;i<lifeTime;i++)
     {
         float p = random(1);
         if(p<0.5) d.genes[i] = dna.genes[i];
         else d.genes[i] = partentB.dna.genes[i];
     }
     Rocket r = new Rocket(d,3);
     return r;
   }
   
   
   
}