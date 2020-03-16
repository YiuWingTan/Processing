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
Attactor attactor;
void setup()
{
  size(1000,800);
  box2d = new Box2DProcessing(this);
  box2d.createWorld();
  box2d.setGravity(0,-20);
  particals = new ArrayList<Partical>();
  attactor = new Attactor(width/2,height/2,100);
}

void draw()
{
  background(150);
  box2d.step();
  attactor.display();
  for(int i = 0;i<particals.size();i++)
  {
     Partical p = particals.get(i);
     p.applyForce(attactor.attract(p));
     p.display();
     if(p.isKill())
     {
      particals.remove(i);
      i--;
     }
  }
  
  if(mousePressed)
  {
   particals.add(new Partical(mouseX,mouseY,random(5,15))); 
  }
}