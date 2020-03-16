class DNA
{
  
  PVector[]genes;
  float maxForce;
  DNA()
  {
    genes = new PVector[lifeTime];
    maxForce = 0.1;
  }
  
  void init()
  {
     for(int i = 0;i<lifeTime;i++)
    {
       genes[i] = PVector.random2D();
       genes[i].mult(random(0,maxForce));
    } 
  }
  
  void mutate(float mutatingRate)//mutating the genes
  {
    for(int i=0;i<lifeTime;i++)
    {
       float p = random(1); 
       if(p<mutatingRate)
       {
           genes[i] = PVector.random2D();
           genes[i].mult(random(maxForce));
       }
    }
  }
}