int time;
SystemController controller;
void setup()
{
  size(1000,800);
  controller = new SystemController();
  Data.Edge = new PVector(width,height);
  Data.gravity = new  PVector(0,0.2);
  Attacker.StartUp();
}

void draw()
{
  background(255);
  controller.display();
  DrawAttracker();
  /*time++;
  println(time);
  */
}

void mousePressed()
{
  PVector mouse = new PVector(mouseX,mouseY);
  controller.AddSystem(mouse);
}

void DrawAttracker()
{
  //strokeWeight(8);
  fill(0);
  ellipse(Attacker.location.x,Attacker.location.y,Attacker.r,Attacker.r);
  noFill();
}