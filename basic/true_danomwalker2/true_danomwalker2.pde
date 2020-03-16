float []x=new float [200];
float []y=new float [200];
float []tx=new float [200];
float []ty=new float[200];
float r=80;
walker[] walker1=new walker[200];
void setup()
{
 size(1000,1000);
 for(int i=0;i<=walker1.length-1;i++)
 {
   x[i]=random(0,1000);
   y[i]=random(0,800);
   tx[i]=random(0,1000);
   ty[i]=random(100,1000);
 }
}
void draw()
{
  background(255);
  for(int i=0;i<=walker1.length-1;i++)
   {
     walker1[i]=new walker(r,i);
     walker1[i].step();
     walker1[i].move();
   }
     
}