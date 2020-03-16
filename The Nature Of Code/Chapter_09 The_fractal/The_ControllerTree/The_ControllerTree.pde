

float angle = PI/10;
void setup()
{
  size(1500,1000);
  background(255);
  //strokeWeight(2);
  translate(width/2,height);
  branch(300,5);
}

void draw()
{
  
}

void branch(float len,float strok)
{
  if(len>2){
    strokeWeight(strok);
  line(0,0,0,-len);
  translate(0,-len);
  strok-=0.5;
  strok = constrain(strok,0.5,5);
  len*=0.66;
  pushMatrix();
  rotate(angle);
  branch(len,strok);
  popMatrix();
  
  pushMatrix();
  rotate(-angle);
  branch(len,strok);
  
  popMatrix();
  // record the state
  }
}