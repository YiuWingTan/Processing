
//int delay = ;
int i = 0;
ArrayList<KochLine> top;
ArrayList<KochLine> down;
ArrayList<KochLine> nextTop;
ArrayList<KochLine> nextDown;
void setup()
{
  size(1500,1000);
  background(255);
  top = new ArrayList<KochLine>();
  down = new ArrayList<KochLine>();
  
  PVector start = new PVector(500,400);
  PVector end = new PVector(width-500,400);
  top.add(new KochLine(start,end));
  
  start = new PVector(500,400);
  end = new PVector(500,height-400);
  top.add(new KochLine(start,end));
  
  start = new PVector(width-500,400);
  end = new PVector(width-500,height-400);
  down.add(new KochLine(start,end));
  
  start = new PVector(500,height-400);
  end = new PVector(width-500,height-400);
  down.add(new KochLine(start,end));
  
  for(int i = 0;i<5;i++) 
    {
      generate();
     }
}

void draw()
{
  if(i<top.size())
  {
  KochLine p = top.get(i);
  p.display();
  }
  if(i<down.size())
  {
  KochLine q = down.get(i);
  q.display();
  }
  i++;
}

void mousePressed()
{
}


void generate()
{
  nextTop = new ArrayList<KochLine>();
  nextDown = new  ArrayList<KochLine>();
 for(KochLine l:top)
 {
     PVector a = l.KochA();
     PVector b = l.KochB();
     PVector c = l.KochC(true);
     PVector d = l.KochD();
     PVector e = l.KochE();
     
     nextTop.add(new KochLine(a,b));
     nextTop.add(new KochLine(b,c));
     nextTop.add(new KochLine(c,d));
     nextTop.add(new KochLine(d,e));
 }
 
 for(KochLine l:down)
 {
     PVector a = l.KochA();
     PVector b = l.KochB();
     PVector c = l.KochC(false);
     PVector d = l.KochD();
     PVector e = l.KochE();
     
     nextDown.add(new KochLine(a,b));
     nextDown.add(new KochLine(b,c));
     nextDown.add(new KochLine(c,d));
     nextDown.add(new KochLine(d,e));
 }
 top = nextTop;
 down = nextDown;
}