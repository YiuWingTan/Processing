class Trainer
{
   float []inputs;
   int answer;
   
   Trainer(float x,float y)
   {
     inputs = new float[3];
     inputs[0] = x;
     inputs[1] = y;
     inputs[2] = 1;
     
     if(y<f(x)) answer = -1;
     else answer = 1;
   }
}