class CA
{
  int[][]cells;
  int [][]nextgan;
  int generation;
  int w;
  int col;
  int row;
  
  
  CA(int _w)
  {
    w = _w;
    col = (int)width/w+2;
    row = (int)height/w+2;
    generation = 0;
    cells = new int[col][row];
    nextgan = new int[col][row];
     for(int i = 1;i<col;i++)
      {
        for(int j =0 ;j<row;j++)
         {
            cells[i][j] = 0;
            nextgan[i][j] = 0;
         }
      } 
     init();
  }
  
  void init()
  {   
      for(int i = 1;i<col-1;i++)
      {
         for(int j = 1;j<row-1;j++)
         cells[i][j] = (int)random(2);
      }
  }
  
  void display()
  {
     int count = 0;
     for(int i = 0;i<col;i++)
     {
        for(int j = 0;j<row;j++)
        {
          if(cells[i][j]==1)
          fill(0);
          else
          fill(250);
           rect(i*w,j*w,w,w);
        }
     }
     generate();
  }
  
  void generate()
  {
    for(int i=1;i<col-1;i++)
    {
       for(int j = 1;j<row-1;j++)
       {
           int next = rule(i,j);
           nextgan[i][j] = next;
       }
    }
    
    for(int i =1;i<col-1;i++)
    {
       for(int j = 1;j<row-1;j++)
       {
          cells[i][j] = nextgan[i][j]; 
       }
    }
  }
  
  int rule(int x,int y)//change the state of CA
  {
    int mark = cells[x][y];
    int number = 0;
    for(int i = x-1;i<=x+1;i++)
    for(int j = y-1;j<=y+1;j++)
    if(cells[i][j]==1)
    number++;
    
    number-=cells[x][y];
    
    if(cells[x][y]==1)
    {
      if(number>=4||number<=1) mark = 0;
      else mark = 1;
    }else
    if(cells[x][y]==0)
    {
       if(number==3)mark = 1; 
       else mark=0;
    }
    //dead become live
    return mark;
  }
  
}