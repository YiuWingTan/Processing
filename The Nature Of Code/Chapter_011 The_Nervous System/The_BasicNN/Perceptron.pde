class Perceptron
{
   float[] weights;
   float c;
   
   Perceptron(int N)
   {
     c = 0.00001;
     weights = new float[N];
     for(int i = 0;i<N;i++)
     {
        weights[i] = random(-1,1); 
     }
   }
   
   int feedforward(float[]inputs)
   {
     float sum = 0;
     for(int i = 0;i<weights.length;i++)
     {
         sum+=weights[i]*inputs[i];
     }
     return active(sum);
   }
   
   int active(float sum)
   {
     if(sum>0) return 1; 
     //if on the right is -1
     return -1;
     //if on the left is 1
   }
   
   void train(float answer,float[] inputs)
   {
     int guess = feedforward(inputs);
     float error = answer-guess;
     for(int i = 0;i<weights.length;i++)
     {
        weights[i]+=c*error*inputs[i];
     }
   }
   
   
   float[] getWeights()
   {
      return weights; 
   }
}