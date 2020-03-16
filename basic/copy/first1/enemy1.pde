class enemy
{
  PVector location;
  PVector speed;
  PVector gunspeed;
  PImage enemy,boom;
  float w,h,bw,bh;
  float A;
  float yspeed,xspeed;
  float gunx;
  float guny;
  float bond1,bond2; //check the shoot location
  boolean again;
  enemy()
  {
    location=new PVector(random(0,displayWidth),random(-displayHeight/2,0));
    gunx=location.x;
    guny=location.y;
    gunspeed=new PVector();
    enemy=loadImage("n_enemy.png");
    boom=loadImage("boom.png");
    yspeed=displayHeight/random(200,400);
    xspeed=displayWidth/random(200,400);
    speed=new PVector(0,yspeed);
    bw=w=displayWidth/7;
    bh=h=displayHeight/6;
    A=height*2/3;
    bond1=displayWidth/6-displayWidth/20;
    again=true;
  }
  
  
  void appear()
  {
    
    
    location.add(speed);
    if(location.x>0&&location.x<width/2&&location.y<10&&location.y>0)
    {
      int s;
      if(random(1)<0.5)
      s=1;
      else
      s=-1;
     speed=new PVector(xspeed*s,yspeed);
    }
    if(location.x>width/2&&location.x<width&&location.y<10&&location.y>0)
   {
     int s;
      if(random(1)<0.5)
      s=1;
      else
      s=-1;
     speed=new PVector(xspeed*s,yspeed);
   }
    if(location.y>A-20)
      {
        if(random(1)<0.5)
        speed=new PVector(-xspeed,-yspeed);
        else
        speed=new PVector(xspeed,-yspeed);
      }
    
    
  }
  
  //show the enemy
  void show()
  {
    image(enemy,location.x,location.y,w,h);
  }
  
  void check()
  {
    if(location.x<0||location.x>width)
    speed.x*=-1;
    
  }
  
  boolean boom()
  {
    image(boom,location.x,location.y,bw,bh);
    if(bw>0)
    {
      bw-=2;
     location.x-=3; 
    }
    if(bh>0)
    {
     bh-=4;
     location.y+=4;
    }
    if(bw<=0&&bh<=0)
    {
      location=new PVector(random(0,displayWidth),random(-displayHeight/2,0));
      bw=w=displayWidth/7;
      bh=h=displayHeight/6;
      return false;
    }
    return true;
  }
  
  
 void attack_monent(PVector attack_monent)
 {
      gunspeed=PVector.sub(attack_monent,location);
      gunspeed.normalize();
      gunspeed.mult(displayWidth/200);
      gunx=location.x+w/2;   // the right location of the gun
      guny=location.y+h*2/3;   // the right location of the gun
      
      
  }
  
  void gunmove( )
  {
    gunx+=gunspeed.x;
    guny+=gunspeed.y;
  }
  
  void show_gun()
  {
    
    ellipse(gunx,guny,w/8,h/8);
    
  }
  
  
  
  void check_dead(PVector plane)
  {
    bond2=plane.x+bond1;
    if(gunx>plane.x&&gunx<bond2&&guny>plane.y&&guny<plane.y+bond1)
    dead=true;
    
  }
  
  
  void first(PVector attack_monent)
  {
      if(again)
      {
      gunspeed=PVector.sub(attack_monent,location);
      gunspeed.normalize();
      gunspeed.mult(displayWidth/200);
      gunx=location.x+w/2;   // the right location of the gun
      guny=location.y+h*2/3;
      again=false;
      }
  }
} 
  
 