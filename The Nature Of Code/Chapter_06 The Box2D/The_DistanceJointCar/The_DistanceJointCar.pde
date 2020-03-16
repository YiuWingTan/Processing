import shiffman.box2d.*;
import org.jbox2d.common.*;
import org.jbox2d.dynamics.joints.*;
import org.jbox2d.collision.shapes.*;
import org.jbox2d.collision.shapes.Shape;
import org.jbox2d.common.*;
import org.jbox2d.dynamics.*;
import org.jbox2d.dynamics.contacts.*;

Box2DProcessing box2d;
Surface surface;
Car car;
ArrayList<Object> particals;
void setup()
{
  size(1000,800);
  box2d = new Box2DProcessing(this);
  box2d.createWorld();
  box2d.setGravity(0,-10);
  surface = new Surface(600);
  car = new Car(100,200);
  particals = new ArrayList<Object>();
}


void draw()
{
  background(250);
  box2d.step();
  for(int i = 0;i<particals.size();i++)
  {
   Object p = particals.get(i);
   p.display();
   if(p.isKill())
   {
     particals.remove(i);
     i--;
   }
  }
  surface.display();
  car.display();
  
  if(mousePressed)
  {
     particals.add(new Object(mouseX,mouseY,random(5,12),false)); 
  }
  
}