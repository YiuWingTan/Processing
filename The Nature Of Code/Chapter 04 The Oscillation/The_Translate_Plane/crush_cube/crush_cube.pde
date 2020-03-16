Cube cube; 
void setup()
{
  size(1000,800);
  cube = new Cube(new PVector(width/2-150,height/2-150),300,200);
  Force.edgeX = width;
  Force.edgeY = height;
  Force.gravity = new PVector();
}

void draw()
{
  background(255);
  cube.display();
}

void mousePressed()
{
  if(mouseX>width/2-150&&mouseX<width/2-150+300)
  {
    if(mouseY>height/2-150&&mouseY<height/2-150+200)
    cube.cubeDown(true);
  }
  
}