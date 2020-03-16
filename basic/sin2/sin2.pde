float periodx;
float periody;
float amplitudex;
float amplitudey;
float x;
float y;
void setup()
{
 size(1500,800); 
 periodx=160;
 periody=80;
 amplitudex=250;
 amplitudey=60;
}
void draw()
{
 background(250);
 stroke(0);
 translate(width/2,height/2);
 x=amplitudex*sin(TWO_PI*frameCount/periodx);
 y=amplitudey*cos(TWO_PI*frameCount/periody)+amplitudey/2;
 line(0,-height/2,x,y);
 ellipse(x,y,16,16);
 //ellipse(0,0,16,16);
}