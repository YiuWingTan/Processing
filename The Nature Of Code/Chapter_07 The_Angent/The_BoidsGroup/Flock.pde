class Flock
{
  ArrayList<Boid>boids;
  
  Flock()
  {
    boids = new ArrayList<Boid>();
  }
  
  void run()
  {
     for(Boid b:boids) 
     {
        b.run(boids); 
     }
  }
  
  void  addBoids()
  {
    for(int i = 0;i<10;i++)
    boids.add(new Boid(random(3,6),6,0.2,50,60));
  }
}