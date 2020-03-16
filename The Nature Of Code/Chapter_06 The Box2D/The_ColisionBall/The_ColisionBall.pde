import shiffman.box2d.*;
import org.jbox2d.common.*;
import org.jbox2d.dynamics.joints.*;
import org.jbox2d.collision.shapes.*;
import org.jbox2d.collision.shapes.Shape;
import org.jbox2d.common.*;
import org.jbox2d.dynamics.*;
import org.jbox2d.dynamics.contacts.*;

Box2DProcessing box2d;
ArrayList<ObjectPartical> particals;
Surface surface;
void setup()
{
  size(1000,800);
  box2d = new Box2DProcessing(this);
  box2d.createWorld();
  box2d.setGravity(0,-10);
  particals = new ArrayList<ObjectPartical>();
  box2d.listenForCollisions();
  surface = new Surface();
}

void draw()
{
  background(150);
  box2d.step(); 
  surface.display();
  for(int i = 0;i<particals.size();i++)
  {
    ObjectPartical p = particals.get(i);
    p.display();
    if(p.isKill())
    {
     particals.remove(i);
     i--;
    }
  }
  
  float i = random(1);
  if(i>0.9)
  {
   float p = random(1);
    if(p<0.5)
     particals.add(new ColorPartical(random(100,width-50),random(-20,200),random(5,8)));
     else
     particals.add(new DeadPartical(random(100,width-50),random(-20,200),random(5,8))); 
  }
  
}

void beginContact(Contact cp)
  {
    Fixture f1 = cp.getFixtureA();
    Fixture f2 = cp.getFixtureB();
    
    Body b1 = f1.getBody();
    Body b2 = f2.getBody();
    
    Object o1 = b1.getUserData();
    Object o2 = b2.getUserData();
    if(o1!=null&&o2!=null)
    {
      if(o1.getClass()==ColorPartical.class&&o2.getClass()==ColorPartical.class)
    {
     ColorPartical p1 = (ColorPartical)o1;
     p1.changeColor();
     ColorPartical p2 = (ColorPartical)o2;
     p2.changeColor();
    }
    
    if(o1.getClass()==DeadPartical.class&&o2.getClass()==DeadPartical.class)
    {
     DeadPartical p1 = (DeadPartical)o1;
     p1.destroy();
     DeadPartical p2 = (DeadPartical)o2;
     p2.destroy();
    }
    }
    
    
  }
  
  void endContact(Contact cp){
    
  }