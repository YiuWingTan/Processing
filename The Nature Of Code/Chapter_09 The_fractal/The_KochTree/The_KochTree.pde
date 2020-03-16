float delay = 900000000;
int number;
float len;
float a;
ArrayList<Branch>tree;
ArrayList<Branch> nextgan;
boolean grew = true;
void setup()
{
  size(1500,1000); 
  a = PI/10;
  len = 200;
  number = 1;
  tree = new ArrayList<Branch>();
  PVector a = new PVector(width/2,height-100);
  PVector b = new PVector(width/2,height);
  Branch B = new Branch(a,b);
  tree.add(B);
}

void draw()
{
  background(255);
  int i = 0;
  for(Branch b:tree)
  {
      b.display();
  }
  if(grew)
  {
  generate();
  while(i++<delay);
  }
}

void mousePressed()
{
   grew = false;
}

void generate()
{
  len*=0.66;
  nextgan = new ArrayList<Branch>();
  for(int i = 0;i<number;i++)
  {
      nextgan.add(tree.get(tree.size()-i-1));
  }
  for(int i = 0;i<number;i++)
  {
    Branch b = nextgan.get(i);
    
    PVector A = b.getA(len);
    PVector B = b.getB(len);
    PVector C = b.getC(len);
    nextgan.add(new Branch(A,B));
    nextgan.add(new Branch(C,B));
  }
  for(int i = number;i<nextgan.size();i++)
  {
    Branch b = nextgan.get(i);
    tree.add(b); 
  }
  number*=2;
}