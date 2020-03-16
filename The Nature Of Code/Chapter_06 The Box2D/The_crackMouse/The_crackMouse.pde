import shiffman.box2d.*;
import org.jbox2d.common.*;
import org.jbox2d.dynamics.joints.*;
import org.jbox2d.collision.shapes.*;
import org.jbox2d.collision.shapes.Shape;
import org.jbox2d.common.*;
import org.jbox2d.dynamics.*;
import org.jbox2d.dynamics.contacts.*;

Box2DProcessing box2d;
Spring spring;
Box box;
ArrayList<Bounder> bounders;
void setup()
{
  size(1000,800);
  box2d = new Box2DProcessing(this);
  box2d.createWorld();
  box2d.setGravity(0,-20);
  box = new Box(50,50);
  spring = new Spring(box);
  bounders = new ArrayList<Bounder>();
  bounders.add(new Bounder(0,0,20,height));
  bounders.add(new Bounder(0,0,width,20));
  bounders.add(new Bounder(width-20,0,20,height));
  bounders.add(new Bounder(0,height-20,width,20));
}

void draw()
{
  background(250);
  box2d.step();
  for(Bounder b:bounders)
  b.display();
  spring.update();
  spring.display();
  box.display();
}

void mousePressed()
{
  if(box.contains(mouseX,mouseY))
  {
     spring.Link();
     spring.setTarget(mouseX,mouseY);
  }
}

void mouseReleased()
{
  spring.destroyTarget();
}