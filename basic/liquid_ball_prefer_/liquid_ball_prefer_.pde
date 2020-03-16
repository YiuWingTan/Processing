float m;
float x,y;
PVector liquidF;
PVector gratity;
movers []movers=new movers[6];
liquid liquid;
void setup(){
 size(1500,900);
 y=150;
 for(int i=0;i<=movers.length-1;i++)
 {
   m=map(random(1),0,1,2,6);
   x=map(random(1),0,1,(m*16)/2,width-(m*16)/2);
   movers[i]=new movers(x,y,m);
 }
 liquid=new liquid(0,height/2,width,height/2,0.1);
   }
   
void draw()
{
  background(255);
  liquid.show();
  for(int i=0;i<=movers.length-1;i++)
  {
    if(liquid.contain(movers[i]))
    {
      liquidF=liquid.liquid_forge(movers[i]);
      movers[i].forge(liquidF);  
    }
    gratity=new PVector(0,0.1*movers[i].mass);
    movers[i].forge(gratity);
    movers[i].location();
    movers[i].show();
    movers[i].check();
  }
}
void mousePressed()
{
  for(int i=0;i<=movers.length-1;i++)
 {
   m=map(random(1),0,1,2,6);
   x=map(random(1),0,1,(m*16)/2,width-(m*16)/2);
   movers[i]=new movers(x,y,m);
 }
}