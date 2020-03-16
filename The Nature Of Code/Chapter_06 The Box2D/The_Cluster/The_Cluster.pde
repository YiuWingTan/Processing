import toxi.physics2d.behaviors.*;
import toxi.physics2d.*;

import toxi.geom.*;
import toxi.math.*;

VerletPhysics2D physics;
Cluster cluster;

void setup()
{
  size(1000,800);
  physics = new VerletPhysics2D();
  physics.setWorldBounds(new Rect(0,0,width,height));
  physics.addBehavior(new GravityBehavior2D(new Vec2D(0,0.1)));
  cluster = new Cluster(10,300,new Vec2D(width/2,height/2));
}

void draw()
{
  background(250);
  physics.update();
  cluster.display();
}