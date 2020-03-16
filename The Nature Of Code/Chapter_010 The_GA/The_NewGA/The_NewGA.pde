String target= "to be nor not to be";
ArrayList<DNA> group;
ArrayList<DNA> matingPool;
float mutationRate = 0.01;
int groupNumber = 500;
PFont f;
void setup()
{
  size(1500,1000);
  f = createFont("Courier",15,true);
  group = new ArrayList<DNA>();
  for(int i = 0;i<groupNumber;i++)
  {
     DNA d = new DNA();
     d.init();
     group.add(d); 
  }
}

void draw()
{
  float best = 0;
  int mark = 0;
  for(int i = 0;i<group.size();i++)
  {
    DNA d = group.get(i);
     d.fitness(); 
     //println(d.fitness);
     if(d.fitness>best){
        best = d.fitness;
        mark = i;
     }
  }
  if(best==1)
    noLoop();
  println(group.get(mark).getPhrase());
  createMatingPool();
  
  int Number = group.size();
  group = new ArrayList<DNA>();
  
  for(int i=0;i<Number;i++)
  {
    int a = (int)random(0,matingPool.size());
    int b = (int)random(0,matingPool.size());
    
    DNA partentA = matingPool.get(a);
    DNA partentB = matingPool.get(b);
    DNA child = partentA.crossover1(partentB);
    child.mutate();
    group.add(child);
  }  
  
  background(255);
  fill(0);
  String everything = "";
  for (int i = 0; i < group.size(); i++) {
    everything += group.get(i).getPhrase() + "     ";
  }
  textFont(f,30);
  text(everything,10,10,width,height);
}


void createMatingPool()
{
    matingPool = new ArrayList<DNA>();
    for(DNA d:group)
    {
        int number = int(d.fitness*100);
        for(int i = 0;i<number;i++)
        {
            matingPool.add(d);
        }
    }
}