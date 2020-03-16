float [] danom=new float[20];
int n;
float x;
void setup()
{
 size(1000,800);
 
}
void draw()
{
  background(5);
  n=int(random(20));
  danom[n]++;
  x=width/20;
  for(int i=0;i<=danom.length-1;i++)
  rect(x*i,height-danom[i],x,danom[i]);
}