import toxi.physics2d.behaviors.*;
import toxi.physics2d.*;

import toxi.geom.*;
import toxi.math.*;

VerletPhysics2D physics;
Net net;

void setup()
{
  size(1000,800);
  physics = new VerletPhysics2D();
  physics.addBehavior(new GravityBehavior2D(new Vec2D(0,0.1)));
  net = new Net(10,20,20,0.125);
}

void draw()
{
  background(250);
  
  physics.update();
  
  net.display();
}