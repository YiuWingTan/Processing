Target[]targets;
Vehicle vehicle;

void setup()
{
  size(640, 360);
  targets = new Target[8];
  for(int i = 0;i<targets.length;i++)
  {
     targets[i] = new Target(); 
  }
  vehicle = new Vehicle(3,4,0.1);
}

void draw()
{
  background(255);
  
  for(int i = 0;i<targets.length;i++)
  {
     targets[i].display(); 
  }
   ellipse(width/2,height/2,50,50);
  vehicle.run();
}

void mousePressed()
{
   targets = new Target[8]; 
   for(int i = 0;i<targets.length;i++)
     targets[i] = new Target();
}