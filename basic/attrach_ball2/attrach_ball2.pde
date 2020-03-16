PVector attrachF;
int n;
Be_attrach_ball[] ball=new Be_attrach_ball[5000];
attrach_ball Aball;
boolean tring;
void setup()
{
 size(1500,1000); 
 Aball=new attrach_ball(width/2,height/2,map(random(1),0,1,8,10));
 ball[0]=new Be_attrach_ball(map(random(1),0,1,180,1300),map(random(1),0,1,80,600),map(random(1),0,1,2,6));
}
void draw()
{
  background(250);
  for(int i=0;i<=n;i++)
  {
    ball[i].jspeed=Aball.attrach(ball[i]);
    for(int j=0;j<=n&&j!=i;j++)
    {
      ball[i].attrach(ball[j]);
      if(j+1==i)
      j=j+2;
    }
      ball[i].location();
      ball[i].check();
      ball[i].show();
  }
 Aball.show2(); 
 if(mouseX>(Aball.location.x-(Aball.mass*16)/2)&&mouseX<(Aball.location.x+(Aball.mass*16)/2)&&mouseY>(Aball.location.y-(Aball.mass*16)/2)&&mouseY<(Aball.location.y+(Aball.mass*16)/2))
 {
   fill(200);
   ellipse(Aball.location.x,Aball.location.y,Aball.mass*16,Aball.mass*16);
   if(mousePressed)
 {
   tring=true;
  Aball.location.x=mouseX;
  Aball.location.y=mouseY;
  fill(0);
  ellipse(Aball.location.x,Aball.location.y,Aball.mass*16,Aball.mass*16);
 }
 else
 tring=false;
 }
}
void mouseReleased()
{
  if(mouseX>10&&mouseX<width-5&&mouseY>10&&mouseY<height-5&&tring==false)
 {
     n++;
     ball[n]=new Be_attrach_ball(mouseX,mouseY,map(random(1),0,1,4,6));
   }
}
      