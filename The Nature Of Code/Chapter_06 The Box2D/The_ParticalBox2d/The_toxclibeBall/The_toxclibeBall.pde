import toxi.physics2d.behaviors.*;
import toxi.physics2d.*;

import toxi.geom.*;
import toxi.math.*;

VerletPhysics2D physics;
ArrayList<Partical> particals;
void setup()
{
  size(1000,800);
  physics = new VerletPhysics2D();
  physics.setWorldBounds(new Rect(0,0,width,height));
  physics.addBehavior(new GravityBehavior2D(new Vec2D(0,0.5)));
  particals = new ArrayList<Partical>();
  float len = 10;
  float number = 20;
  float strength = 0.01;
  for(int i = 0;i<number;i++)
  {
    Partical p = new Partical(new Vec2D(width/2+i*len,20));
    physics.addParticle(p);
    particals.add(p);
    if(i!=0)
    {
      Partical perv = particals.get(i-1);
      VerletSpring2D spring = new VerletSpring2D(p,perv,10,0.05);
      physics.addSpring(spring);
    }
  }
  Partical p = particals.get(0);
  p.lock();
}

void draw()
{
  physics.update();
  background(250);
  beginShape();
  for(int i = 0;i<particals.size();i++)
  {
    Partical p = particals.get(i);
    vertex(p.x,p.y);
  }
  endShape();
  Partical p = particals.get(19);
  p.display();
}

/*void draw()
{
  background(250);
  physics.update();
  line(p1.x,p1.y,p2.x,p2.y);
  p1.display();
  p2.display();
  if(mousePressed)
  {
   p2.lock();
   p2.x = mouseX;
   p2.y = mouseY;
   p2.unlock();
  }
}*/