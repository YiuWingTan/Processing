
ArrayList<Line> lines;
ArrayList<Line> nextgan;
void setup()
{
   size(1500,1000);
   lines = new ArrayList<Line>();
   
   PVector a = new PVector(100,100);
   PVector b = new PVector(width-100,100);
   lines.add(new Line(a,b));
   
   
}

void draw()
{
  background(255);
  for(Line l:lines)
  {
     l.display(); 
  }
}

void generate()
{
  nextgan = new ArrayList<Line>();
  
  for(Line l:lines)
  {
     PVector a = l.getA();
     PVector b = l.getB();
     PVector c = l.getC();
     PVector d = l.getD();
     
     nextgan.add(new Line(a,b));
     nextgan.add(new Line(c,d));
  }
  lines = nextgan;
}

void mousePressed()
{
   generate(); 
}