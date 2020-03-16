int count;
PVector start;
PVector end;
float f(float x){
  return  0.4*x+1;
}
Perceptron perceptron;
ArrayList<Trainer> trainers;

float xmin;
float ymin;
float xmax;
float ymax;

void setup()
{
  size(1500,500);
  xmin = -width/2;
  ymin = -height/2;
  xmax =  width/2;
  ymax =  height/2;
  count = 0;
  perceptron = new Perceptron(3);
  trainers = new ArrayList<Trainer>();
  for(int i = 0;i<100;i++)
  {
     trainers.add(new Trainer(random(-width/2,width/2),random(-height/2,height/2))); 
  }
}

void draw()
{
  background(255);
  translate(width/2,height/2);
  perceptron.train(trainers.get(count).answer,trainers.get(count).inputs);
  count = (count+1)%trainers.size();
  
  for(int i = 0;i<trainers.size();i++)
  {
      int value = perceptron.feedforward(trainers.get(i).inputs);
      
      if(value>0) fill(255,0,0);
      else fill(0);
      ellipse(trainers.get(i).inputs[0],trainers.get(i).inputs[1],15,15);
  }
  trainers.add(new Trainer(random(-width/2,width/2),random(-height/2,height/2)));
  drawLine();
}


void drawLine()
{
   stroke(2);
   fill(150);
   strokeWeight(4);
   float x1 = xmin;
   float y1 = f(x1);
   float x2 = xmax;
   float y2 = f(x2);
   line(x1,y1,x2,y2);
   
   
   stroke(0);
  strokeWeight(1);
  float[] weights = perceptron.getWeights();
  x1 = xmin;
  y1 = (-weights[2] - weights[0]*x1)/weights[1];
  x2 = xmax;
  y2 = (-weights[2] - weights[0]*x2)/weights[1];
  line(x1,y1,x2,y2);
}