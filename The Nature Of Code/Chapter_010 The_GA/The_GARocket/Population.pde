class Population
{
   int generation;
   ArrayList<Vehicle> population;
   ArrayList<Vehicle> matingPool;
   int Number;
   
   Population(int _number)
   {
     Number = _number;
     mutationRate = 0.01;
     generation = 0;
     population = new ArrayList<Vehicle>();
     matingPool = new ArrayList<Vehicle>();
    
     for(int i =0;i<Number;i++)
     {
        DNA d = new DNA(); 
        d.init();
        population.add(new Vehicle(d,3));
     }
   }
   
   
   void fitness(Target target)
   {
     for(Vehicle v:population)
     {
         v.fitness();
     }
   }
   
   void selection()//count the matingPool
   {
     matingPool.clear();
     float maxFitness = getMaxFitness();
     
     for(Vehicle v:population)
     {
          int n = int(map(v.fitness,0,maxFitness,0,1)*100);
          for(int i = 0;i<n;i++)
          {
             matingPool.add(v); 
          }
     }
   }
   
   void reproduction()//producte the population
   {
     population.clear();
     println(Number);
     for(int i = 0;i<Number;i++)
     {
        int a = (int)random(0,matingPool.size());
        int b = (int)random(0,matingPool.size());
        
        Vehicle vehicleA = matingPool.get(a);
        Vehicle vehicleB = matingPool.get(b);
        
        Vehicle child = vehicleA.crossover(vehicleB);
        
        population.add(child);
     }
   }
   
   void live()
   {
     println("There are have "+population.size()+"in the population");
     for(Vehicle v:population)
     {
        v.run(); 
     }
   }
   
   float getMaxFitness()//get the fitness
   {
     float max = 0;
     for(Vehicle v:population)
     {
        if(max<v.fitness)
          max = v.fitness;
     }
     return max;
   }
   
   
   void mutate()
   {
      for(Vehicle v:population)
      {
         v.dna.mutate(); 
      }
   }
   
}