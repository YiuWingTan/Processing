ArrayList<Boid>boids;
void setup()
{
  size(1500,1000);
  boids = new ArrayList<Boid>();
  for(int i = 0;i<10;i++)
  {
     boids.add(new Boid(3,6,0.2,50,150)); 
  }
}

void draw()
{
  background(250);
  for(Boid b:boids)
  {
     b.flock(boids);
     b.run(); 
  }
}

void mousePressed()
{
  for(int i=0;i<5;i++)
   boids.add(new Boid(3,6,0.2,50,150)); 
}