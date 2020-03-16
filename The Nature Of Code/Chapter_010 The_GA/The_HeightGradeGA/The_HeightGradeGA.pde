int lifeCount;
int lifeTime;
Target[] target;
Population population;
Obstacle[] obstacle;
void setup()
{
  size(1500,1000);
  
  lifeTime = 600;
  lifeCount = 0;
  
  target = new Target[2];
  obstacle = new Obstacle[2];
  population = new Population(20,0.01);
  
  target[1] = new Target(width/2,height/2-400,10);
  obstacle[0] = new Obstacle(width/2,height/2-100,400,20);
  obstacle[1] = new Obstacle(width/2-350,height/2-250,400,20);


  PVector left = new PVector(obstacle[1].location.x+obstacle[1].w,obstacle[1].location.y);
  PVector right = obstacle[0].location;
  PVector middle = PVector.add(right,left);
  middle.div(2);
  target[0] = new Target(middle.x,middle.y,0);
  //init the data
}

void draw()
{
  background(255);
  for(Obstacle b:obstacle){
    b.display();
  }
  
  for(Target t:target){
    t.display();
  }
  
  population.live();
  lifeCount++;
  
  if(lifeCount>=lifeTime){
    population.countFitness();
    
     population.createMatingPool(); 
     
     population.startBreed();
     lifeCount = 0;
  }
}