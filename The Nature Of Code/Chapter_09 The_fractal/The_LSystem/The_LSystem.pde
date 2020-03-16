int counter;
Turtle turtle;
LSystem lsystem;
void setup()
{
  size(1500,1000);
  counter = 0;
  Rule[]rules = new Rule[1];
  rules[0] = new Rule('F',"FF+[+F-F-F]-[-F+F+F]");
  //create the rule
  
  lsystem = new LSystem("F",rules);
  
  turtle = new Turtle(lsystem.getSentence(),100,radians(25));
}

void draw()
{
  background(255);
 
  translate(width/2,height);
  //rotate(-PI/2);
  turtle.render();
  
  noLoop();
}

void mousePressed()
{
  if(counter<5)
  {
    pushMatrix();
    lsystem.generate();
    turtle.setToDo(lsystem.getSentence());
    turtle.changeLen(0.6);
    popMatrix();
    redraw();
    counter++;
  }
}