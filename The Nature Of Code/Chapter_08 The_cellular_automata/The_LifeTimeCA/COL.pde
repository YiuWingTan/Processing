class COL
{
  int row;
  int col;
  int w;
  Cell[][] board;
  color[][]nextgan;
  color origin;
  color target;
  float start;
  float end;
 boolean Change;
 
 COL(int _w )
 {
   w = _w;
   row = width/w+2;
   col = height/w+2;
   board = new Cell[row][col];
   nextgan = new color[row][col];
   Change = true;
   init();
 }
  
  
  void init()
  {
     for(int i = 0;i<row;i++)
     {
       for(int j = 0;j<col;j++)
       {
          board[i][j] = new Cell(); 
          
          float p = random(0,1);
          if(p<0.3) 
          {
            board[i][j].colorSelf = nextgan[i][j] = Data.life;
            board[i][j].lifeState = board[i][j].previousState = random(0,1);
          }
          else if(p<0.6) 
          {
            board[i][j].colorSelf = nextgan[i][j]= Data.lifeStrong;
            board[i][j].lifeState = board[i][j].previousState = random(1,2);
            
          }else
          {
             board[i][j].colorSelf = nextgan[i][j] = Data.dead; 
             board[i][j].lifeState = board[i][j].previousState = random(2,3);
          }
          //println(board[i][j].lifeState);
       }
     }
  }
  
  
  void display()
  {
    for(int i = 1;i<row-1;i++)
    {
       for(int j = 1;j<col-1;j++)
       {
           fill(board[i][j].colorSelf);
           rect((i-1)*w,(j-1)*w,w,w);
       }
    }
  }
  
  void generate()
  {
    color next;
    for(int i = 1;i<row-1;i++)
    {
       for(int j = 1;j<col-1;j++)
       {
          next = rule(i,j);
          nextgan[i][j] = next; 
       }
    }
    
    for(int i = 1;i<row-1;i++)
    {
     for(int j =1;j<col-1;j++)
     {
         board[i][j].colorSelf = nextgan[i][j];
     }
    }
  }
  
  color rule(int x,int y)
  {
    color tar = board[x][y].colorSelf;
    boolean pass = false;
    int l = 0;
    int s = 0;
    int d = 0;
    float life = board[x][y].lifeState;
    for(int i =x-1;i<=x+1;i++)
    {
       for(int j = y-1;j<=y+1;j++)
       {
         float time = board[i][j].lifeState;
         if(i!=x&&j!=y)
           if(time<1) l++;
           else if(time<2) s++;
           else if(time<3) d++;
       }
    }
    //count the total
    
    //println(l);
   // println(s);
    //println(d);
    board[x][y].previousState = board[x][y].lifeState;
    board[x][y].lifeState+=0.01;
    if(board[x][y].lifeState>3&&board[x][y].previousState<=3) {
      Change = canStart(l,s,d,board[x][y].lifeState);
      pass = true;  
    }
    else if(board[x][y].lifeState>1&&board[x][y].previousState<=1) {
      Change = canStart(l,s,d,board[x][y].lifeState);
      pass = true;
    }
    else if(board[x][y].lifeState>2&&board[x][y].previousState<=2) {
      Change = canStart(l,s,d,board[x][y].lifeState);
      pass = true;
    }
    
    if(pass)
    {
      
      if(Change)//is on the change state
      {
        float lifeTime = board[x][y].lifeState;
        selectData(lifeTime);
        if(lifeTime>=3) lifeTime = board[x][y].previousState = board[x][y].lifeState = 0;
        tar = lerpColor(origin,target,map(lifeTime,start,end,0,1));
        //println(1);
      }else//is not on the change state
      {
        board[x][y].lifeState = board[x][y].previousState;
        board[x][y].previousState-=0.01;
        //println(2);
      }
    }else
    {
        float lifeTime = board[x][y].lifeState;
        selectData(lifeTime);
        tar = lerpColor(origin,target,map(lifeTime,start,end,0,1));
        //println(lifeTime);
    }
    return tar;
  }
  
  void selectData(float p)
  {
      if(p<1||p>=3){origin = Data.life;target = Data.lifeStrong;start = 0;end = 1;}
      else if(p<2){origin = Data.lifeStrong;target = Data.dead;start = 1;end = 2;}
      else if(p<3){origin = Data.dead;target = Data.life;start = 2;end = 3;}
  }
  
  boolean canStart(int l,int s,int d,float state)
  {
    boolean can = false;
      if(state<=1&&(d>=2||s<3))  can = true;
      else if(state<=2&&(d<3)) can = true;
      else if(state<=4&&(s>2||l>2)) can = true;
      return can;
  }
  // saw is can change
}