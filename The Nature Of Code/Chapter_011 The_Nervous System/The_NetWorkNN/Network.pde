class Network
{
  ArrayList<Neuron> neurons;
  PVector location;
  
  Network(float x,float y)
  {
    location = new PVector(x,y);
    neurons = new ArrayList<Neuron>();
  }
  
  void display()
  {
    pushMatrix();
    translate(location.x,location.y);
    for(Neuron n:neurons)
    {
      n.display();
    }
   popMatrix();
  }
  
  void addNeuron(Neuron a)
  {
    neurons.add(a);
  }
  
  void addConnection(Neuron a,Neuron b)
  {
    Connection c = new Connection(a,b,random(1));
    
    a.addConnection(c);
  }
  
  void feedforward(float input)
  {
    Neuron first = neurons.get(0);
    first.feedforward(input);
  }
}