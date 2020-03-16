class Population
{
  ArrayList<Rocket> population;
  ArrayList<Rocket> matingPool;
  int  Number;
  int generation;
  float mutatingRate;
  float maxFitness;
  
  Population(int _Number,float _mutatingRate)
  {
    Number = _Number;
    mutatingRate = _mutatingRate;
    generation = 0;
    population = new ArrayList<Rocket>();
    matingPool = new ArrayList<Rocket>();
    for(int i = 0;i<Number;i++)
    {
        DNA d = new DNA();
        d.init();
        Rocket r = new Rocket(d,3);
        population.add(r);
    }
    //create the population
  }
  
  void live()
  {
     for(Rocket r:population)
     {
       r.run();
     }
     
  }
  //draw the rocket
  
  void createMatingPool()
  {
    matingPool.clear();
    float max = getMaxFitness();
    for(Rocket r:population)
    { 
       int n = int(map(r.fitness,0,max,0,1)*100);
       
       for(int i = 0;i<n;i++)
       {
          matingPool.add(r); 
       }
    }
  }
  //create the matingPool
  
  void startBreed()
  {
    population.clear();
    
    for(int i = 0;i<Number;i++)
    {
        int a = (int)random(0,matingPool.size());
        
        int b = (int)random(0,matingPool.size());
        
        Rocket partentA = matingPool.get(a);
        Rocket partentB = matingPool.get(b);
        
        Rocket child = partentA.mating1(partentB);
        child.mutating(mutatingRate);
        population.add(child);
    }
    generation++;
  }
  
  void countFitness()
  {
    for(Rocket r:population)
    {
       r.fitness2();
       //r.fitness2();
    }
  }
  
  float getMaxFitness()
  {
    float maxFitness = 0;
    for(Rocket r:population)
    {
       if(r.fitness>maxFitness)
       {
          maxFitness = r.fitness; 
       }
    }
    
    return maxFitness;
  }
}