int counter = 0;
Turtle turtle;
LSystem lsystem;
void setup()
{
  size(1500,1000);
  background(255);
  Rule[]rules = new Rule[1];
  rules[0] = new Rule('F',"FF+[+F-F-F]-[-F+F+F]");
  lsystem = new LSystem("F",rules);
  turtle = new Turtle(lsystem.genSentence(),60,radians(30));
}

void draw()
{
 
}

void mousePressed()
{
  if(counter<6)
  {
     background(255);
     turtle.render();
     lsystem.generate();
     turtle.setTodo(lsystem.genSentence());
     turtle.reSeti();
     turtle.generateLine(0,null);
     turtle.changeLen(0.6);
     counter++; 
  }
}