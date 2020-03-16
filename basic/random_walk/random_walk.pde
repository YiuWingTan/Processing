walker []walker1=new walker[600];
float x,y;
void setup()
{
  size(2000,1000);
 for(int i=0;i<=walker1.length-1;i++)
 {
   x=random(2000);
   y=random(1000);
  walker1[i]=new walker(x,y,3);
 }
}
void draw()
{
  background(0);
  for(int n=0;n<=walker1.length-1;n++)
 {
  walker1[n].step();
  walker1[n].random_walk();
 }
}