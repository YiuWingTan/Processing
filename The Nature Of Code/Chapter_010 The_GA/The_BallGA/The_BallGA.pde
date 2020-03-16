
World world;
void setup()
{
  size(1500,1000);
  world = new World();
}

void draw()
{
  background(255);
  world.run();
}