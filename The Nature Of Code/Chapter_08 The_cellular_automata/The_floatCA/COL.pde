class COL
{
  int w;
  int row; 
  int col;
  float [][]nextgan;
  float [][]board;
  
  COL(int _w)
  {
    w = _w;
    row = height/w+2;
    col = width/w+2;
    nextgan = new float[row][col];
    board = new float[row][col];
    init();
  }
  
  void init()
  {
    for(int i =0;i<row;i++)
    {
       for(int j = 0;j<col;j++)
       {
           nextgan[i][j] = board[i][j] = random(1);
       }
    }
  }
  
  void generate()
  {
     float next;
     for(int i = 1;i<row-1;i++)
     {
        for(int j =1;j<col-1;j++)
        {
            next = rule(i,j);
            nextgan[i][j] = next;
        }
     }
     
     for(int i =1;i<row-1;i++)
     {
        for(int j =1;j<col-1;j++)
        {
            board[i][j] = nextgan[i][j];
        }
     }
  }
  
  float rule(int x,int y)
  {
    float self = board[x][y];
    int child = 0;
    int strong = 0;
    int mature = 0;
    int old = 0;
    
    for(int i = x-1;i<x+1;i++)
    {
       for(int j = y-1;j<y+1;j++)
       {
          if(i!=x&&j!=y)
          {
            if(board[i][j]<0.2) child++;
            else if(board[i][j]<0.5) strong++;
            else if(board[i][j]<0.8) mature++;
            else old++;
          }  
       }
    }
    
    if(self<0.2&&(strong>=1||mature<2)) self = random(0.2,0.5);
    else if(self<0.5&&(child>=1||old>=2)) self = random(0.5,0.8);
    else if(self<0.8&&(strong>=1)) self = random(0.8,1);
    else if(self<1&&(child>=1||strong>=1)) self = random(0,0.2);
    //self = random(1);
    return self;
  }
  
  void display()
  {
    for(int i = 1;i<row-1;i++)
    {
       for(int j =1;j<col-1;j++)
       {
   
         if(board[i][j]<0.2) fill(188,210,138);
         else if(board[i][j]<0.5) fill(198,26,255);
         else if(board[i][j]<0.8) fill(105,211,238);
         else fill(22,225,255);
         rect((i-1)*w,(j-1)*w,w,w);
       }
    }
  }
}