import toxi.geom.*;
import toxi.physics2d.*;
import toxi.physics2d.behaviors.*;

VerletPhysics2D physics;
Node node;
Attacket attacket;
void setup(){
  size(1000,800);
  physics = new VerletPhysics2D();
  physics.setWorldBounds(new Rect(0,0,width,height));
  physics.addBehavior(new GravityBehavior2D(new Vec2D(0,0.5)));
  node = new Node(20,200,new Vec2D(width/2,height/2));
  attacket = new Attacket(new Vec2D(width/2,height/2),100,0,1);
}

void draw(){
  background(250);
  physics.update();
  attacket.display();
  node.display();
  
}