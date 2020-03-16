class CA
{
  int[] cells;
  int[] ruleset;
  int w;
  int generation;
  float change;
  CA(int _w)
  {
    w = _w;
    generation = 0;
    cells = new int[(int)width/w];
    ruleset = new int[]{0,1,0,1,1,0,1,0};
    for(int i = 0;i<cells.length;i++)
      cells[i] = 0;
      cells[(int)cells.length/2] = 1;
      display();
      change = random(1);
  }
  
  void generate()
  {
    int[] nextgen = new int[cells.length];
    for(int i = 1;i<nextgen.length-1;i++)
    {
        int left = cells[i-1];
        int right = cells[i+1];
        int me = cells[i];
        //nextgen[i] = rules(left,me,right);
        //if(change<0.5)
        nextgen[i] = rules(left,me,right);
       
    }
    nextgen[0] = nextgen[nextgen.length-1] = 0;
    cells = nextgen;
    generation++;
    
  }
  
  int rules(int a,int b,int c)
  {
    String str = ""+a+b+c;
    int index = Integer.parseInt(str,2);
    return ruleset[index];
  }
  
  int rules(int a,int b)
  {
    String s =""+a+b;
    int index = Integer.parseInt(s,2);
    return ruleset[index];
  }
  
  
  
  void display()
  {
    stroke(0);
    strokeWeight(0);
    int count = (int)height/w;
    for(int j = 1;j<=count;j++)
    {
    for(int i = 1;i<cells.length-1;i++)
    {
      if(cells[i]==0)
      fill(250);
      else
      fill(0);
      
      rect((i-1)*w,generation*w,w,w);
    }
    generate();
    }
  }
  
  void reSet()
  {
     background(255);
     generation = 0;
     change= random(1);
     display();
  }
  
}