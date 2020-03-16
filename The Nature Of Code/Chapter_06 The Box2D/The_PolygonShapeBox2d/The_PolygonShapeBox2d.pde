import shiffman.box2d.*;
import org.jbox2d.collision.shapes.*;
import org.jbox2d.common.*;
import org.jbox2d.dynamics.*;

Box2DProcessing box2d;
ArrayList<Partical> particals;
Surface surface1;
Surface surface2;
void setup()
{
  size(1000,800);
  box2d = new Box2DProcessing(this);
  box2d.createWorld();
  particals = new ArrayList<Partical>();
  surface1 = new Surface(600,500,500,5);
  surface2 = new Surface(200,700,400,5);
}

void draw()
{
  background(250);
  box2d.step();
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
  surface2.display();
  surface1.display();
  if(mousePressed)
  {
    particals.add(new Partical(mouseX,mouseY));
  }
}