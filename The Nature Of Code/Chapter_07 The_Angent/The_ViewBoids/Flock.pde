class Flock
{
  ArrayList<Boid> boids;
  
  Flock()
  {
    boids = new ArrayList<Boid>();
  }
  
  void addBoid()
  {
     for(int i = 0;i<10;i++)
     {
        boids.add(new Boid(random(3,5),random(5,8),random(0.15,0.35),150,PI/6)); 
     }
  }
  
  void run()
  {
     for(Boid b:boids)
     {
        b.run(boids); 
     }
  }
}