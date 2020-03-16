


void setup()
{
  size(1500,1000);
  background(255);
  strokeWeight(2);
  translate(width/2,height);
  branch(300);
}

void draw()
{
  
}

void branch(float len)
{
  if(len>2){
  line(0,0,0,-len);
  translate(0,-len);
  
  len*=0.6;
  pushMatrix();
  rotate(PI/6);
  branch(len);
  popMatrix();
  
  pushMatrix();
  rotate(-PI/6);
  branch(len);
  
  popMatrix();
  // record the state
  }
}