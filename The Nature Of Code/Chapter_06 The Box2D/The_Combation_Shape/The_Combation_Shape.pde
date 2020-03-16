import shiffman.box2d.*;
import org.jbox2d.collision.shapes.*;
import org.jbox2d.common.*;
import org.jbox2d.dynamics.*;

ArrayList<Partical> particals;
Box2DProcessing box2d;
Surface surface;

void setup()
{
  size(1000,800);
  box2d = new Box2DProcessing(this);
  box2d.createWorld();
  particals = new ArrayList<Partical>();
  surface = new  Surface(200,500,400,5);
}

void draw()
{
  box2d.step();
  background(250);
  surface.display();
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
    particals.add(new Partical(mouseX,mouseY));
  }
}