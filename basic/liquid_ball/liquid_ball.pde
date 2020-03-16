liquid liquid;
move []mover=new move[9];
float x,y;
float m;
PVector liquidF;
void setup()
{
  size(1500,900);
  smooth();
  liquid=new liquid(0,height/2,width,height/2);
  for(int i=0;i<=mover.length-1;i++)
  {
    m=map(random(1),0,1,2,3);
    x=map(random(0,1),0,1,(m*16)/2,1499-(m*16)/2);
    y=100;
    mover[i]=new move(x,y,m);
}
}
void draw()
{
  background(255);
  liquid.show();
  for(int i=0;i<=mover.length-1;i++)
  {
    
    if(liquid.text(mover[i]))
    {
     liquidF= liquid.liquiddrge(mover[i]);
     }
    else
    liquidF=new PVector(0,0);
    mover[i].cont(liquidF);
    mover[i].check();
    mover[i].show();
  }
}
void mousePressed()
{
  for(int i=0;i<=mover.length-1;i++)
  {
    m=map(random(1),0,1,2,6);
    x=map(random(0,1),0,1,(m*16)/2,1499-(m*16)/2);
    y=0;
    mover[i]=new move(x,y,m);
}
}