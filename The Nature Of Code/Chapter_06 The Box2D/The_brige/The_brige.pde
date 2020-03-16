import shiffman.box2d.*;
import org.jbox2d.common.*;
import org.jbox2d.dynamics.joints.*;
import org.jbox2d.collision.shapes.*;
import org.jbox2d.collision.shapes.Shape;
import org.jbox2d.common.*;
import org.jbox2d.dynamics.*;
import org.jbox2d.dynamics.contacts.*;


Box2DProcessing box2d;
ArrayList<Partical> particals;
Brige brige;

void setup()
{
  size(1000,800);
  box2d = new Box2DProcessing(this);
  box2d.createWorld();
  box2d.setGravity(0,-10);
  particals = new ArrayList<Partical>();
  brige = new Brige(400);
}

void draw()
{
  background(250);
  box2d.step();
  
  brige.display();
  for(int i = 0;i<particals.size();i++)
  {
     Partical p = particals.get(i); 
     p.display();
     if(p.isKill())
     {
        particals.remove(i);
        i--;
     }
  }
  if(mousePressed)
  {
    Partical q = new Partical(mouseX,mouseY,random(10,20),random(5,15));
    particals.add(q);
  }
}