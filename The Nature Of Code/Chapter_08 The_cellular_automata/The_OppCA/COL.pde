class COL
{
  float cellHeight;
  float cellWidth;
  Cell[][] board;
  int[][] nextgan;
  int row;
  int col;
  PVector firstLeft;
  PVector firstRight;
  PVector secondLeft;
  PVector secondRight;
  float setoff = 0;
  
  COL(int h,int w)
  {
      cellHeight = h;
      cellWidth = w;
      row = result(height,h)*2+2;
      col = result(width,w)*2+2;
      println("the row is "+row);
      println("the col is"+col);
      board = new Cell[row][col];
      nextgan = new int[row][col];
      init();
  }
  
  void init()
  {
    firstLeft = new PVector(0-cellWidth/2,0-cellHeight/2-cellHeight);
    firstRight = new PVector(0,0-cellHeight/2-cellHeight);
    secondRight = new PVector(0,0-cellHeight);
    secondLeft = new PVector(0-cellWidth/2,0-cellHeight);
    int ji,ou ;
    ji = ou = 0;
    for(int j = 0;j<col;j++)
    {
      //ji = ou = 0;
       for(int i = 0;i<row;i++)
       {
         PVector left;
         PVector right;
          if(j%2==0)
          {
              left = new PVector(firstLeft.x+j*cellWidth/2-setoff,firstLeft.y+i*cellHeight);
              right = new PVector(firstRight.x+j*cellWidth/2-setoff,firstRight.y+i*cellHeight);
              ou++;
          }else
          {
            left = new PVector(secondLeft.x+j*cellWidth/2-setoff,secondLeft.y+i*cellHeight);
            right = new PVector(secondRight.x+j*cellWidth/2-setoff,secondRight.y+i*cellHeight);
            ji++;
          }
          board[i][j] = new Cell(cellHeight,cellWidth,left,right);
          board[i][j].set();
       }
    }
  }
  
  void display()
  {
     for(int j = 0;j<col;j++)
     {
        for(int i = 0;i<row;i++)
        {
           board[i][j].display(); 
        }
     }
  }
    
  int result(float a,float b)
  {
      float s = a/b;
      int t = (int)s;
      if(s-t>=0.5)
      return t+1;
      return t;
  }
  
  void generate()
  {
     for(int i=1;i<row-1;i++)
     {
        for(int j = 1;j<col-1;j++)
        {
            nextgan[i][j] = rule(i,j);
            //board[i][j].setState();
        }
     }
     for(int i = 1;i<row-1;i++)
     {
        for(int j = 1;j<col-1;j++)
        {
           board[i][j].setState(nextgan[i][j] );
        }
     }
  }
  
  int rule(int x,int y)
  {
    //println("go in");
    int count = 0;
    int self = board[x][y].state;
   for(int i = x-1;i<=x+1;i++)
   {
      if(i<x)
      {
          count+=board[i][y].state;
          count+=board[i][y+1].state;
      }else if(i==x)
      {
          count+=board[i][y-1].state;
          count+=board[i][y+1].state;
      }else
      {
          count+=board[i][y+1].state;
          count+=board[i][y].state;
      }
   }
   if(self==1&&count<2) {float p = random(1);if(p<0.8)self = 0;}
   else if(self==1&&count>3) {float p = random(1);if(p<0.6) self = 0;}
   else if(self==0&&count==3) self = 1;
   return self;
  }
}