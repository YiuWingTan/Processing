int lifetime;
float mutationRate;
int lifeCounter;
Target target;
Obstacle obstacle;
Population population;

void setup()
{
  size(1500,1000);
  lifetime = 300;
  population = new Population(10);
  target = new Target(10);
  mutationRate = 0.008;
  PVector loc = new PVector(width/2-100,height/2-200);
  obstacle = new Obstacle(loc,400,30);
}

void draw()
{
  background(255);
  target.display();
  population.live();
  obstacle.display();
  
  lifeCounter++;
  if(lifeCounter>=lifetime)
  {
    println("start mating");
    lifeCounter = 0;
    population.fitness(target);
    population.selection();
    population.reproduction();
  }
}

void mousePressed()
{
   target.setTarget(mouseX,mouseY); 
}