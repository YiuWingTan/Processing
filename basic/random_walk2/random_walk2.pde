walker[] walker1=new walker[600];
float[] x1=new float[600];
float[] y1=new float[600];
float r1=80;
void setup()
{
 size(1000,800);
 for(int i=0;i<=walker1.length-1;i++)
 {
   x1[i]=int(random(0,1000));
   y1[i]=int(random(0,800));
 }
 }
void draw()
{
  background(0);
 for(int i=0;i<=walker1.length-1;i++)
 {
   walker1[i]=new walker(i,r1);
   walker1[i].laction();
   walker1[i].show();
 }
}