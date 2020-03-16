class CA
{
  int[] cells;
  int[] ruleset;
  int w;
  int number;
  int []head;
  
  CA(int _w)
  {
    w = _w;
    cells = new int[(int)width/w];
    head = new int[cells.length];
    ruleset = new int[]{0,1,0,1,1,0,1,0};
    for(int i = 0;i<cells.length;i++)
      cells[i] = 0;
      cells[(int)cells.length/2] = 1;
      number = 1;
      for(int i = 0;i<head.length;i++)
      head[i] = 0;
      head[(int)head.length/2] = 1;
  }
  
  void generate()
  {
    int[] nextgen = new int[cells.length];
    for(int i = 1;i<nextgen.length-1;i++)
    {
        int left = cells[i-1];
        int right = cells[i+1];
        int me = cells[i];
        nextgen[i] = rules(left,me,right);
    }
    nextgen[0] = nextgen[nextgen.length-1] = 0;
    cells = nextgen;
    
  }
  
  int rules(int a,int b,int c)
  {
    String str = ""+a+b+c;
    int index = Integer.parseInt(str,2);
    return ruleset[index];
  }
  
  void display()
  {
    
    background(250);
    rolling();
    for(int i = number;i>0;i--)
    {
        for(int j = 1;j<cells.length-1;j++)
        {
          if(cells[j]==1)
         {
            fill(0);
            rect(w*(j-1),height-i*w,w,w);
         }
        }
        generate();
    }
    number++;
  }
  
  void rolling()
  {
    if(number>height/w)
    {
      //println("yes");
      int[] nextgan = new int[head.length];
        for(int i =1;i<head.length-1;i++)
        {
            int next = rules(head[i-1],head[i],head[i+1]);
            nextgan[i] = next;
        }
        nextgan[0] = nextgan[head.length-1] = 0;
        head = nextgan;
        number = (int)height/w;
    }
    for(int i = 0;i<head.length;i++)
        {
           cells[i] = head[i]; 
        }
  }
}