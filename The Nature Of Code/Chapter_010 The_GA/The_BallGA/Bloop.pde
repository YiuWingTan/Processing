class Bloop
{
  DNA dna;
  PVector location;
  PVector velocity;
  color life;
  color dead;
  int healthy;
  float maxSpeed;
  float r;
  float setx;
  float sety;
  Bloop(DNA _dna)
  {
      dna = _dna;
      setx = 0;
      sety = 1000;
      life = color(255);
      dead = color(150);
      healthy = 100;
      location = new PVector(random(width),random(height));
      velocity = new PVector();
      maxSpeed = map(dna.genes[0],0,1,15,0);
      r = map(dna.genes[0],0,1,0,50);
  }
  
  void run()
  {
     update();
     display();
     edge();
  }
  
  void update()
  {
    float x = map(noise(setx),0,1,-maxSpeed,maxSpeed);
    float y = map(noise(sety),0,1,-maxSpeed,maxSpeed);
    
    setx+=0.01;
    sety+=0.01;
    
    velocity.set(x,y);
    location.add(velocity);
    healthy--;
  }
  
  void eat(ArrayList<Food>foods)
  {
     for(int i = 0;i<foods.size();i++)
     {
        float dist = PVector.dist(location,foods.get(i).location);
        if(dist<r){
        foods.remove(foods.get(i));
        healthy+=100;  
        i--;
      }
     }
    
  }
  
  boolean isDead()
  {
    if(healthy<=0)
      return true;
    else 
      return false;
  }
  
  Bloop reproduct(float mutateRate)
  {
    Bloop pl = null;
    float p = random(1);
    if(p<mutateRate){
        DNA d = dna.copy();
        pl = new Bloop(d);
    }
    return pl;
  }
  
  void display()
  {
    color col = lerpColor(life,dead,map(healthy,0,100,0,1));
    fill(col);
    ellipse(location.x,location.y,r,r);
    noFill();
  }
  
  
  void edge()
  {
     if(location.x>width+r) location.x = -r;
     if(location.x<-r) location.x = width-r;
     if(location.y>height-r) location.y = -r;
     if(location.y<-r) location.y = height-r;
  }
  
}