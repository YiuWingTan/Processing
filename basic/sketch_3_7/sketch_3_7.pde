 float  number=100;
oscillator []p=new oscillator[100];
void setup()
{
 size(1500,800);
 for(int i=0;i<number;i++)
 p[i]=new oscillator();
}
void draw()
{
  background(250);
  for(int i=0;i<number;i++)
  {
   p[i].run(); 
  }
}