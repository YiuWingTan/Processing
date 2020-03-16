
Network network;
void setup()
{
  size(1500,1000);
  Neuron a = new Neuron(500,0,50);
  Neuron b = new Neuron(-500,0,50);
  Neuron c = new Neuron(0,400,75);
  Neuron d = new Neuron(0,-400,75);
  network = new Network(width/2,height/2);
  network.addNeuron(b);
  network.addNeuron(a);
  network.addNeuron(c);
  network.addNeuron(d);
  network.addConnection(b,c);
  network.addConnection(c,a);
  network.addConnection(b,d);
  network.addConnection(d,a);
}

void draw()
{
  background(255);
  network.display();
  if(frameCount%30==0)
  network.feedforward(random(1));
}