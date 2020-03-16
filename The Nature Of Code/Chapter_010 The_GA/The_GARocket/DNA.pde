class DNA
{
   float maxForce;
   PVector []genes;
   
   DNA()
   {
      maxForce = 0.1;
      genes = new PVector[lifetime]; 
   }
   
   void init()
   {
      for(int i = 0;i<genes.length;i++)
      {
        genes[i] = PVector.random2D();
        genes[i].mult(random(0,maxForce));
      }
   }
   
   void mutate()
   {
     for(int i = 0;i<lifetime;i++)
     {
        float p = random(1);
        if(p<mutationRate)
        genes[i] = PVector.random2D();
     }
   }
}