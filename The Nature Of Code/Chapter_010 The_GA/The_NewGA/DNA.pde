class DNA
{
  float fitness;
  char[]genes;
  
  DNA()
  {
      genes = new char[target.length()];
  }
  
  void init()
  {
    for(int i = 0;i<genes.length;i++)
    {
       genes[i] = (char)random(32,128);
    }
  }
  
  void fitness()
  {
    int number = 0;
    for(int i = 0;i<genes.length;i++)
    {
       if(genes[i]==target.charAt(i))
         number++;
    }
    number*=number;
    fitness = map(number,0,genes.length*genes.length,0,1);
  }
  
  DNA crossover1(DNA partentB)
  {
    DNA child = new DNA();
    int mark = (int)random(0,genes.length);
    for(int i = 0;i<genes.length;i++)
    {
      if(i>mark)
       child.genes[i] = genes[i];
       else child.genes[i] = partentB.genes[i];
    }
    
    return child;
  }
  //the first way
  
  
  DNA crossover2(DNA partentB)
  {
    DNA child = new DNA();
    
    for(int i = 0;i<genes.length;i++)
    {
       float p = random(1);
       if(p<0.5) child.genes[i] = genes[i];
       else child.genes[i] = partentB.genes[i];
    }
    
    return child;
  }
  //the second way
  
  
  void mutate()
  {
    for(int i = 0;i<genes.length;i++)
    {
      float p = random(1);
      if(p<mutationRate)
      {
          genes[i] = (char)random(32,128);
      }
    }
  }
  String getPhrase()
  {
     return new String(genes); 
  } 
}