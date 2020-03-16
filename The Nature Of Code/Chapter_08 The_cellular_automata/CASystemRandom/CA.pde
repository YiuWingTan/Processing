class CA
{
  int w;
  int[]ruleset;
  int []cells;
  int generation;
  
  CA(int _w)
  {
    w = _w;
    int size = (int)width/w;
    cells = new int[size+2];
    generation = 0;
    for(int i = 0;i<cells.length;i++)
    {
        cells[i] = 0;
    }
    cells[cells.length/2] = 1;
    ruleset = new int[]{0,1,0,1,1,0,1,0};
  }
  
  void display()
  {
    for(int i =1;i<cells.length-1;i++)
    {
        if(cells[i]==1)
        {
           fill(0);
           rect((i-1)*w,generation*w,w,w);
        }
    }
  }
  
  int rule(int a,int b,int c)
  {
    String s = ""+a+b+c;
    int index = Integer.parseInt(s,2);
    return ruleset[index];
  }
  
  void generate()
  {
    int[]nextgan = new int[cells.length];
    
    for(int i = 1;i<cells.length-1;i++)
    {
        int next = rule(cells[i-1],cells[i],cells[i+1]);
        nextgan[i] = next;
    }
    nextgan[0] = nextgan[cells.length-1] = 0;
    cells = nextgan;
    generation++;
  }
  
  void reSet()
  {
    background(250);
    generation = 0;
    for(int i = 0;i<ruleset.length;i++)
    {
       ruleset[i] = (int)random(2); 
    }
  }
  
  boolean finished()
  {
    int count = height/w;
     if(generation==count-1)
     return true;
     return false;
  }
}