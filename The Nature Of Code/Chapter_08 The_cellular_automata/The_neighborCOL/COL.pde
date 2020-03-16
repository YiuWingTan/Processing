class COL
{
  int cells[][];
  int nextgan[][];
  int w;
  int col;
  int row;
  
  COL(int _w)
  {
    w = _w;
    col = width/w;
    row = height/w;
    cells = new int[col][row];
    nextgan = new int[col][row];
    init();
  }
  
  void display()
  {
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
    for(int i = 0 ;i<col;i++)
    {
       for(int j = 0;j<row;j++)
       {
           int next = rule(i,j);
           nextgan[i][j] = next;
          
       }
    }
    
    for(int i = 0;i<col;i++)
    {
       for(int j = 0;j<row;j++)
       cells[i][j] = nextgan[i][j];
    }
  }
  
  int rule(int x,int y)
  {
    int mark = cells[x][y];
    int number = 0;
    int px = x,py = y;
    for(int i = x-1;i<=x+1;i++)
    {
      px = i;
      if(i<0) px = col-1;
      if(i>col-1) px = 0;
      for(int j = y-1;j<y+1;j++)
      {
         py = j;
         if(j<0) py = row-1;
         if(j>row-1) py = 0;
         if(cells[px][py]==1)
         number++;
      }
    }
    number-=mark;
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
    return mark;
  }
  
  void init()
  {
    for(int i = 1;i<col-1;i++)
      {
         for(int j = 1;j<row-1;j++)
         cells[i][j] = (int)random(2);
      }
  }
}