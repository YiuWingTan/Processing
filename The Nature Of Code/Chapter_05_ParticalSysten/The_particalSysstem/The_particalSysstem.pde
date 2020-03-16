particalSystem system;
void setup()
{
  size(1500,800);
  system = new particalSystem(new PVector(width/2,height/2));
  Data.edgeX = new PVector(width,0);
  Data.edgeY = new PVector(height,0);
  Data.gravity = new PVector(0,0.2);
}

void draw()
{
  background(250);
  system.run();
  system.reSetLocation(new PVector(mouseX,mouseY)); 
}

/*void mousePressed()
{
 
}*/