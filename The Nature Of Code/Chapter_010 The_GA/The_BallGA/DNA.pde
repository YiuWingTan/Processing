class DNA 
{
  float[] genes;
  
  DNA()
  {
    
    genes = new float[1];
    
    for(int i = 0;i<genes.length;i++)
    {
       genes[i] = random(1); 
    }
    
    
  }
  
  
  DNA(float[]_genes)
  {
      genes = _genes;
  }
  
  DNA copy()
  {
      float[] newgenes = new float[genes.length];
      
      arraycopy(genes,newgenes);
      return new DNA(newgenes);
  }
}