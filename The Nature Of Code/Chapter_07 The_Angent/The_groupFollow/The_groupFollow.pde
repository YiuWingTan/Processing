ArrayList<Number> vehicles;
FlowField flowField;
void setup()
{
  size(1500,1000);
  flowField = new FlowField(50);
  vehicles = new ArrayList<Number>();
  
  for(int i = 0;i<3;i++)
  {
     vehicles.add(new Number(5,0.8,20)); 
  }
}

void draw()
{
  background(240);
  flowField.display();
  for(Number v:vehicles)
  {
      v.follow(flowField);
      v.separate(vehicles);
      v.run();
  }
}

void mousePressed()
{
  vehicles.add(new Number(5,0.8,20)); 
}