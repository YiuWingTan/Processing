class CA
{
  ArrayList<int[]> net;
  int []ruleset;
  int []cells;
  int w;
  int generation;
  int scollDirection;
  boolean isScoll;
  
  CA(int _w)
  {
    w = _w;
    generation= 0 ;
    cells = new int[width/w];
    for(int i = 0;i<cells.length;i++)
    {
       cells[i] = 0 ;
    }
    cells[cells.length/2] = 1;
    ruleset = new int[]{0,1,0,1,1,0,1,0};
    net = new ArrayList<int[]>();
    scollDirection = 0;
    isScoll = false;
  }
  
  void display()
  {
    background(250);
    int count = height/w;
    for(int j = 0;j<count;j++)
    {
      
      for(int i = 1;i<cells.length-1;i++)
      {
         if(cells[i]==1)
         {
            fill(0);
            rect((i-1)*w,generation*w,w,w);
         }
      }
      if(!isScoll)
      net.add(cells);
      generate();
      
    }
    
  }
  
  void generate()
  {
    int[] nextgan = new int[cells.length];
    
    for(int i = 1;i<cells.length-1;i++)
    {
        int next = rule(cells[i-1],cells[i],cells[i+1]);
        nextgan[i] = next;
    }
    nextgan[0] = nextgan[cells.length-1] = 0;
    generation++;
    cells = nextgan;
  }
  
  int rule(int a,int b,int c)
  {
    String s = ""+a+b+c;
    int n = Integer.parseInt(s,2);
    return ruleset[n];
  }
  
  void scorll(int _scollDirection)
  {
    isScoll = true;
    scollDirection += _scollDirection;
    if(scollDirection<0)
    scollDirection = 0;
    addNet();
  }
  
  void addNet()
  {
    generation = 0;
    if(scollDirection<=net.size()-1)
    cells = net.get(scollDirection);
    else
    {
      cells = net.get(net.size()-1);
       for(int i = net.size();i<=scollDirection;i++)
       {
           generate();
           net.add(cells);
       }
       cells = net.get(scollDirection);
    }
    display();
  }
  
}