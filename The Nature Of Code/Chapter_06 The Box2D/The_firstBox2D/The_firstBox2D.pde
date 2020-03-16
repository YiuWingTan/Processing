import shiffman.box2d.*;
import org.jbox2d.collision.shapes.*;
import org.jbox2d.common.*;
import org.jbox2d.dynamics.*;
import org.jbox2d.dynamics.joints.*;

Box2DProcessing box2d;
ArrayList<Box> boxs;
Surface surface;
//Bounder bounder1;
//Bounder bounder2;
void setup()
{
   size(1000,800);
   boxs = new ArrayList<Box>();
   box2d = new Box2DProcessing(this);
   box2d.createWorld();
   box2d.setGravity(0,-20);
   surface = new  Surface();
   //bounder1 = new Bounder(700,600,500,5);
   //bounder2 = new Bounder(200,700,500,5);
}

void draw()
{
  background(200);
  box2d.step();
  surface.display();
  Box p = new Box();
  boxs.add(p);
  for(int i =0;i<boxs.size();i++)
  {
     Box node = boxs.get(i);
     node.display();
  }
  //bounder1.display();
  //bounder2.display();
}