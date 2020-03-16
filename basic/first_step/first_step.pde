float x;
float y;
float r=80;
float speedx=6,speedy=8;
int dirationx,dirationy;
void setup()
{
 dirationx=dirationy=1;
 size(1000,800);
 x=40;
 y=40;
 fill(0);
}
 void draw()
{
  background(255);
   if(x<40||x>959)
   dirationx=-dirationx;
   if(y<40||y>759)
   dirationy=-dirationy;
   x=x+speedx*dirationx;
   y=y+speedy*dirationy;
   ellipse(x,y,r,r);
}