Mover mover;
void setup()
{
  size(1000,800);
  mover = new Mover(width/2,0,250);
}

void draw()
{
  background(55,110,200);
  mover.Go();
}

void mousePressed()
{
  PVector mouse = new PVector(mouseX,mouseY);
  float distance = PVector.sub(mouse,mover.location).mag();
  if(distance<=50){
    mover.location.set(mouseX,mouseY);
  }
}

void mouseReleased()
{
   
}