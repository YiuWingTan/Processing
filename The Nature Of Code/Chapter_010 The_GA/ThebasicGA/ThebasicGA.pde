String target;
ArrayList<DNA> population;
ArrayList<DNA> matingpool;
PFont f;
void setup()
{
  size(1500,1000);
  f = createFont("Courier",15,true);
  population = new ArrayList<DNA>();
  target = "to be or nor to be";
  for(int i = 0;i<300;i++)
  {
    DNA d = new DNA();
    d.init();
    population.add(d);
  }
}

void draw()
{
  float best = 0;
  int mark = 0;
  for(int i = 0;i<population.size();i++)
  {
     DNA d = population.get(i);
     d.fitness1();
     if(d.fitness>best)
     {
        mark = i;
        best = d.fitness;
     }
  }
  println("The best is ",population.get(mark).getPhrase());
  
  if(best>=1) noLoop();
  
  createMatingPool1();
  int number = population.size();
  population = new ArrayList<DNA>();
  for(int i = 0;i<number;i++)
  {
     int a = (int)random(0,matingpool.size()); 
     int b = (int)random(0,matingpool.size());
     
     DNA partentA = matingpool.get(a);
     DNA partentB = matingpool.get(b);
     
     DNA child = partentA.crossover1(partentB);
     child.mutate();
     population.add(child);
  }
  
  background(255);
  fill(0);
  String everything = "";
  for (int i = 0; i < population.size(); i++) {
    everything += population.get(i).getPhrase() + "     ";
  }
  textFont(f,30);
  text(everything,10,10,width,height);
  //noLoop();
}

void createMatingPool1()
{
   matingpool = new ArrayList<DNA>(); 
   for(DNA d:population)
   {
      //println(1);
      int number = int(d.fitness*100);
      for(int i = 0;i<number;i++)
      {
        matingpool.add(d);
      }
   }
}

void createMatingPool2()
{
  matingpool = new ArrayList<DNA>();
  for(DNA d:population)
  {
     float p = random(1);
     if(p<d.fitness)
     {
       int number =int(d.fitness*100);
       for(int i = 0;i<number;i++)
        matingpool.add(d); 
     }
  }
}
//the function of Monte Carlo



void mousePressed()
{
   redraw(); 
}