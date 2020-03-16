import shiffman.box2d.*;
import org.jbox2d.collision.shapes.*;
import org.jbox2d.common.*;
import org.jbox2d.dynamics.*;

Box2DProcessing box2d;
ArrayList<Partical> particals;
Surface surface;
SinSurface sinSurface;
noiseSurface noisesurface;
void  setup()
{
  size(1000,800);
  box2d = new Box2DProcessing(this);
  box2d.createWorld();
  box2d.setGravity(0,-10);
  particals =new ArrayList<Partical>();
  //surface = new Surface();
  //sinSurface = new SinSurface();
  noisesurface = new noiseSurface();
}


void draw()
{
  box2d.step();
  background(250);
  for(int i = 0;i<particals.size();i++)
  {
   Partical p = particals.get(i);
   p.display(); 
   if(p.isKillObject())
   {
     particals.remove(p);
     i--;
   }
   
  }
  noisesurface.display();
  if(mousePressed)
  {
     particals.add(new Partical(mouseX,mouseY)); 
  }
}