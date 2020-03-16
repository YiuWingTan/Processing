Flock flock;

void setup()
{
  size(1500,1000);
  flock = new Flock();
}

void draw()
{
  background(250);
  flock.run();
}

void mousePressed()
{
   flock.addBoids(); 
}