Be_attrach_ball []ball1=new Be_attrach_ball[100];
attrach_ball ball2;
attrach_drage drage;
float dis;
int n;
PVector attrach_drage;
void setup()
{
  size(1500,900);
  ball2=new  attrach_ball(width/2,height/2,map(random(1),0,1,5,12));
  drage=new attrach_drage();
  ball1[0]=new Be_attrach_ball(600,400,map(random(1),0,1,2,6));
}

void draw()
{
  background(255);
  for(int i=0;i<=n;i++)
  {
    dis=dist(ball1[i].location1.x,ball1[i].location1.y,ball2.location2.x,ball2.location2.y);
    attrach_drage=drage.attrach(dis,ball1[i],ball2);
    ball1[i].attrach(attrach_drage,dis);
    ball1[i].location();
    ball1[i].check();
    ball1[i].show();
  }
  ball2.show(); 
}
void mouseReleased()
{
if(mouseX>0&&mouseX<1499&&mouseY>0&&mouseY<899)
  {
    n++;
    ball1[n]=new Be_attrach_ball(mouseX,mouseY,map(random(1),0,1,2,6));
  }
}


 