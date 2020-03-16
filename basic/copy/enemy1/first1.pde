PImage imgstart,imgend,imgstart1,imgend1,deadui;
boolean start=false,spressed=false,epressed=false;
sky sky;
pop plane;
boolean dead=false;
float x1,x2,y1,y2;
float w,h;
int enemydie;

void setup()
{
  
  x1=x2=(displayWidth)/2/2;
  y1=displayHeight/100;
  y2=displayHeight-displayHeight/2;
  w=displayWidth/2;
  h=displayHeight/2;
  size(displayWidth,displayHeight);
  imgstart=loadImage("start.png");
  imgend=loadImage("end.png");
  imgstart1=loadImage("scopy.png");
  imgend1=loadImage("ecopy.png");
  deadui=loadImage("");
  plane=new pop();
  sky=new sky();
 
  
}

void draw()
{
  if(dead==false)
  {
   if(start==true)
   {
    sky.show_and_update();//the background of sky
    plane();
   }
   else
   {
     mouse();
   }
  }
  else
  {
    deadui();
  }
}


void mouse()
{
  if(mouseX>x1&&mouseX<x1+w&&mouseY>y1&&mouseY<y1+h)
  {
    if(mousePressed)
    {
      spressed=true;
      background(194);
      image(imgstart1,x1+displayWidth/20,y1*4/3,w*4/5,h*4/5);
      image(imgend,x2,y2,w,h);
    }
    else
    {
      background(194);
      image(imgstart1,x1,y1,w,h);
      image(imgend,x2,y2,w,h);
    }
    
  }
  else
  if(mouseX>x2&&mouseX<x2+w&&mouseY>y2&&mouseY<y2+h)
  {
    if(mousePressed)
    {
     epressed=true;
     background(194);
     image(imgend1,x2+displayWidth/20,y2*16/15,w*4/5,h*4/5);
     image(imgstart,x1,y1,w,h);
    }
    else
    {
      background(194);
     image(imgend1,x2,y2,w,h);
     image(imgstart,x1,y1,w,h);
    }
  }
  else
  {
    background(194);
    image(imgstart,x1,y1,w,h);
    image(imgend,x2,y2,w,h);
  }
}

void mouseReleased()
{
  if(spressed==true&&mouseX>x1&&mouseX<x1+w&&mouseY>y1&&mouseY<y1+h)
  {
    start=true;
  }
  if(epressed==true&&mouseX>x2&&mouseX<x2+w&&mouseY>y2&&mouseY<y2+h)
  {
    exit();
  }
}

void plane()
{
    
    plane.update(); //update the location of plane
    plane.gun();
    plane.gunupdate();
    plane.guncheck();
    plane.check(); //avoid the plane fly away
    plane.show();  //show the plane
    plane.enemy(); //the enenmy
    plane.attack_check();
}


void deadui()
{
  exit();
}