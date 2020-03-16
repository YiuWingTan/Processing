pop_up_ball ball;
float x,y,mass;
float angle=-PI/4;
PVector gratity=new  PVector(0,0.2);
PVector Bounce;
boolean getup=false;
PVector location=new PVector(50,700);
void setup()
{
  mass=map(random(1),0,1,2,6);
 size(1500,800);
 ball=new pop_up_ball(location.x,location.y,mass*16,mass);
}
void draw()
{
  background(255);
  pushMatrix();
  translate(location.x,location.y);
  rotate(angle);
  rect(0-(mass*16)/2,0-(mass*16)/2,100,mass*16);
  popMatrix();
  if(getup==true)
  {
    ball.applyforce(gratity);
    ball.update();
  }
  ball.check();
  ball.show();
}


void keyPressed()
{
  if(key==CODED&& keyCode ==RIGHT)
  angle+=0.1;
  if(key==CODED&&keyCode==LEFT)
  angle-=0.1;
  
}

void keyReleased()
{
  if(key==' ')
  {
   PVector force = PVector.fromAngle(angle);
   force.mult(10);
   ball.applyforce(force);
   getup=true;
  }
}

void mousePressed()
{
  ball=new pop_up_ball(location.x,location.y,mass*16,mass);
  getup=false;
}