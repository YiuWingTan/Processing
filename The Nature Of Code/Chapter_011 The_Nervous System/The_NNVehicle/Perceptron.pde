class Perceptron
{
  float[]weights;
  float c;
  
  Perceptron(int n,float _c)
  {
    c = _c;
    weights = new float[n];
    for(int i = 0;i<n;i++)
    {
        weights[i] = random(0,1);
    }
  }
  
  PVector feedforward(PVector[] forces)
  {
      PVector sum = new PVector();
      for(int i = 0;i<weights.length;i++)
      {
          forces[i].mult(weights[i]);
          
          sum.add(forces[i]);
      }
      return sum;
  }
  
  void train(PVector[]forces,PVector error)
  {
      for(int i = 0;i<weights.length;i++)
      {
          weights[i] += c*error.x*forces[i].x;
          weights[i] += c*error.y*forces[i].y;
          weights[i] = constrain(weights[i], 0, 1);
      }
  }
}