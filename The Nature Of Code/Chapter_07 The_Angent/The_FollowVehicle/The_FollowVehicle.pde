FlowField flowField;
ArrayList<Vehicle> vehicles;

void setup()
{
  size(640,360);
  flowField = new FlowField();
  vehicles = new ArrayList<Vehicle>();
}

void draw()
{
  background(250);
  float node = random(1);
  flowField.display();
  for(int i = 0;i<vehicles.size();i++)
  {
     Vehicle p = vehicles.get(i);
     p.follow(flowField);
     p.update();
     p.display();
     if(p.isDead())
     vehicles.remove(i);
  }
  flowField.display();
  flowField.update();
  if(node>0.8)
  vehicles.add(new Vehicle(3,6,0.3));
}