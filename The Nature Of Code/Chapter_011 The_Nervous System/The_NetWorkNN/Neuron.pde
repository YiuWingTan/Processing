class Neuron
{
  PVector  location;
  float r ;
  float sum;
  ArrayList<Connection>connections;
  
  Neuron(float x,float y,float _r)
  {
    sum = 0;
    location = new PVector(x,y);
    connections = new ArrayList<Connection>();
    r = _r;
  }
  
  void display()
  {
    stroke(0);
    fill(255,0,0);
    ellipse(location.x,location.y,r,r);
    
    for(Connection c:connections)
    {
       c.display(); 
    }
  }
  
  void addConnection(Connection b)
  {
    connections.add(b);
  }
  
  void feedforward(float input)
  {
    sum+=input;
    if(sum>1){
      fire();
      sum = 0;
    }
  }
  
  
  
  void fire()
  {
      for(Connection c:connections)
      {
         c.feedforward(sum);
      }
  }
}