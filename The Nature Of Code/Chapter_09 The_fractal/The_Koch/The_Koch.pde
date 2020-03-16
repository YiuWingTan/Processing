
ArrayList<KochLine> kochs;
ArrayList<KochLine> next;
void setup()
{
  size(1500,1000);
  kochs = new ArrayList<KochLine>();
  PVector start = new PVector(0,height/2);
  PVector end = new PVector(width,height/2);
  kochs.add(new KochLine(start,end));
}

void draw()
{
  background(255);
  for(KochLine k:kochs)
  {
      k.display();
  }
}

void mousePressed()
{
    for(int i = 0;i<2;i++) 
    {
      generate();
     }
}


void generate()
{
  next = new ArrayList<KochLine>();
 for(KochLine l:kochs)
 {
     PVector a = l.KochA();
     PVector b = l.KochB();
     PVector c = l.KochC();
     PVector d = l.KochD();
     PVector e = l.KochE();
     
     next.add(new KochLine(a,b));
     next.add(new KochLine(b,c));
     next.add(new KochLine(c,d));
     next.add(new KochLine(d,e));
 }
 kochs = next;
}