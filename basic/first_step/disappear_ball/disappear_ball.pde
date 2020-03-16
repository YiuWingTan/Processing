int num=60;
float x[]=new float[num];
float y[]=new float[num];
void setup()
{
  size(1000,800);
  noStroke();
 fill(255);
}
void draw()
{
  background(0);
  if(mousePressed){
 for(int i=x.length-1;i>0;i--){
       x[i]=x[i-1];
       y[i]=y[i-1];}
       x[0]=mouseX;
       y[0]=mouseY;
 for(int n=0;n<=x.length-1;n++){
       ellipse(x[n],y[n],50,50);}
  }
}