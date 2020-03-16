Vehicle vehicle;
Target[] targets;
void setup()
{
  size(1800,1000);
  targets = new Target[(int)random(5,16)];
  for(int i = 0;i<targets.length;i++)
  targets[i] = new Target(random(50,width),random(50,height),10);
  targets = select(targets);
  vehicle = new Vehicle(targets,6,0.1,3);
}

void draw()
{
  background(250);
  for(int i = 0;i<targets.length;i++)
  targets[i].display();
  vehicle.move();
}

Target[] select(Target[] target)
{
  for(int i = 0;i<target.length;i++)
  {
      int mark = i;
      for(int j = i+1;j<target.length;j++)
      {
        if(target[j].location.x>target[mark].location.x)
        {
            mark = j;
        }
      }
      Target node = target[i];
      target[i] = target[mark];
      target[mark] = node;
  }
  
  return target;
}

void mousePressed()
{
  for(int i = 0;i<targets.length;i++)
  targets[i] = new Target(random(50,width),random(50,height),10);
  targets = select(targets);
  vehicle.setTarget(targets);
}
//sort the data of target