class COL
{
   int w;
   int row;
   int col;
   RBG [][] board;
   RBG[][] nextgan;
   
   COL(int _w)
   {
     w = _w;
     col = height/w+2;
     row = width/w+2;
     board = new RBG[row][col];
     nextgan = new RBG[row][col];
     init();
   }
   
   void display()
   {
     for(int i =1;i<row-1;i++)
     {
        for(int j =1;j<col-1;j++)
        {
         fill(board[i][j].r,board[i][j].g,board[i][j].b); 
         strokeWeight(0);
         rect((i-1)*w,(j-1)*w,w,w);
        }
     }
   }
   
   void generate()
   {
     RBG next = null ;
     for(int i = 1;i<row-1;i++)
     {
      for(int j = 1;j<col-1;j++)
      {
        next = rule(i,j);
        nextgan[i][j] = next;
      }
     }
     
     for(int i =1;i<row-1;i++)
     {
      for(int j = 1;j<col-1;j++)
      {
         board[i][j] = nextgan[i][j]; 
      }
     }
   }
   
   RBG rule(int x,int y)
   {
     int r = 0;
     int g = 0;
     int b = 0;
     for(int i = x-1;i<=x+1;i++)
     {
        for(int j =y-1;j<=y+1;j++)
        {
           r += board[i][j].r;
           g += board[i][j].g;
           b += board[i][j].b;
        }
     }
     r = r/4;
     b = b/4;
     g = g/4;
     board[x][y].r = r;
     board[x][y].g = g;
     board[x][y].b = b;
     RBG self = board[x][y];
     return self;
   }
   
   void init()
   {
     for(int i = 0;i<row;i++)
     {
        for(int j = 0;j<col;j++)
        {
            board[i][j] = new RBG();
            nextgan[i][j] = new RBG();
            board[i][j].r = nextgan[i][j].r = (int)random(0,255);
            board[i][j].g = nextgan[i][j].g = (int)random(255);
            board[i][j].b = nextgan[i][j].b = (int)random(255);
        }
     }
   }
}