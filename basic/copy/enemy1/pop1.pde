class pop
{
  int the_number_of_enemy=5;
  float mass;
  PVector location;
  float w,h;
  float x,y;
  PImage plane;
  boolean move=false;
  PVector speed;
  float []xgun=new float [40];
  float []ygun=new float [40];
  int n=0,last=0;
  boolean text=true;
  boolean []attack=new boolean[the_number_of_enemy];
  enemy []enemy=new enemy[the_number_of_enemy];
  
  pop()
  {
    location=new PVector(displayWidth/2,displayHeight/2);
    xgun[0]=mouseX;
    ygun[0]=mouseY;
    speed=new PVector(0,displayWidth/80);
    plane=loadImage("plane.gif");
    w=displayWidth/6;
    h=displayHeight/6;
    for(int i=0;i<=enemy.length-1;i++)
  {
    attack[i]=false;
    enemy[i]=new enemy();
  }
  }
  
  
  void gun()
  {
    
     
    if(text==true&&frameCount>=1)
    {
      xgun[n]=mouseX;
      ygun[n]=mouseY;
      n++;
      last++;
      frameCount=0;
    }
    //build ball until have 50 ball
  }
  
  
 //the locatin of plane
  void update()  
  {
     x=mouseX-w/2;
     y=mouseY-h/2;
    location=new PVector(x,y);
  }
  
  //show the plane
  void show()
  {
    image(plane,location.x,location.y,w,h);
  }
  
  void check()
  {
   if(x<0)
   x=0;
   if(x>displayWidth)
   x=displayWidth;
   if(y<0)
   y=0;
   if(y>displayHeight)
   y=displayHeight;
  }
  
  void gunupdate()
  {
    
    for(int i=0;i<n;i++)
    {
      ygun[i]-=speed.y;
      ellipse(xgun[i],ygun[i],9,9);
    }
  }
  
  
  void guncheck()
  {
    if(n==xgun.length)
    {
      text=false;
      n--;
    }
    //check if build 50 ball?
    for(int i=0;i<=n;i++)
    {
      if(ygun[i]<0&&text==false&&frameCount>=1)
     {
      ygun[i]=mouseY;
      xgun[i]=mouseX;
      frameCount=0;
     }
    }
  }
 
 
 
 //show the enemy attack or not attack
 void enemy()
{
  for(int i=0;i<=enemy.length-1;i++)
  {
    if(attack[i]==false)  //check the enemy attack
    {
    enemy[i].appear();//control the enemy diration
    enemy[i].show();
    enemy[i].check();
    }
    
    else
    {
      attack[i]=enemy[i].boom();
    }
    if(enemy[i].location.y>-50&&attack[i]==false)
     enemy[i].first(location);
    if(enemy[i].gunx>0&&enemy[i].gunx<displayWidth&&enemy[i].guny<displayHeight)
    {
      enemy[i].gunmove();
      enemy[i].show_gun();
      enemy[i].check_dead(location);
      if(dead==true)
      break;
    }
    if(attack[i]==false&&(enemy[i].gunx<0||enemy[i].guny>displayHeight||enemy[i].gunx>displayWidth))
    enemy[i].attack_monent(location);
    
  }
 
}
 
 //check the enemy attack or not attack
 void attack_check()
 {
   
   for(int i=0;i<=enemy.length-1;i++)
   {
     if(enemy[i].location.y>0)
     for(int n=0;n<=xgun.length-1;n++)
     if(xgun[n]>enemy[i].location.x&&xgun[n]<enemy[i].location.x+w&&ygun[n]>enemy[i].location.y&&ygun[n]<enemy[i].location.y+h)
     {
        attack[i]=true;
        break;
     }
     }
   }
 
}

































































  