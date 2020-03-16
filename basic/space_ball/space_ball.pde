attrach_ball attrach_ball;
space []space=new space[200];
float dist;
int n;
void setup()
{
  size(1500,900);
  attrach_ball=new attrach_ball(width/2,height/2,map(random(1),0,1,4,11));
  space[0]=new space(map(random(1),0,1,200,1200),map(random(1),0,1,150,800),map(random(1),0,1,2,6));
}

//main
void draw()
{
  background(255);
  for(int i=0;i<=n;i++)
  {
    space[i].applyforge(attrach_ball);
    space[i].update();
    space[i].turn();
    space[i].check();
    space[i].show();
  }
  attrach_ball.check();
  attrach_ball.show();
}

void mousePressed()
{
  float dist=dist(mouseX,mouseY,attrach_ball.location.x,attrach_ball.location.y);
  if(dist>(attrach_ball.mass*16)/2)
  {
   n++;
   space[n]=new space(mouseX,mouseY,map(random(1),0,1,2,6));
  }
}