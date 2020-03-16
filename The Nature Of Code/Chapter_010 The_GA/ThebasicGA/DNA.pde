class DNA
{
   char[]genes;
   float fitness;
   float mutationRate;
   
   DNA()
   {
      mutationRate = 0.01;
      genes = new char[18]; 
   }
   
   void init()
   {
      for(int i = 0;i<genes.length;i++)
      {
          genes[i] = (char)random(32,128);
      } 
   }
   
   void fitness1()
   {
     int number = 0;
      for(int i = 0;i<genes.length;i++)
      {
         if(genes[i]==target.charAt(i))
         {
             number++;
         }
      }
      fitness = float(number)/float(target.length());
   }
   
  
  DNA crossover1(DNA partentB)
  {
      DNA child = new DNA();
      int midpoint = int(random(0,genes.length));
      for(int i = 0;i<genes.length;i++)
      {
          if(i>midpoint) child.genes[i] = genes[i];
          else child.genes[i] = partentB.genes[i];
      }
      
      return child;
  }
  
  void mutate()
  {
      for(int i = 0;i<genes.length;i++)
      {
         if(random(1)<mutationRate)
         {
            genes[i] = (char)random(36,128); 
         }
      }
  }
  
  
  
  DNA crossover2(DNA partentB)
  {
      DNA child = new DNA();
      int midpoint = int(random(0,genes.length));
      for(int i = 0;i<genes.length;i++)
      {
         float p = random(1);
         if(p<0.5) child.genes[i] = genes[i];
         else child.genes[i] = partentB.genes[i];
      }
      
      return  child;
  }
  
  String getPhrase()
  {
     return new String(genes); 
  }
  
}