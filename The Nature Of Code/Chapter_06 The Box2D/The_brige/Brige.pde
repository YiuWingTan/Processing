class Brige
{
   float y;
   Body body;
   ArrayList<Ball> brige;
   Brige(float h)
   {
     brige = new ArrayList<Ball>();
     y = h;
     createBall();
     createJoin();
   }
  
  
  void createJoin()
  {
    float len = 15;
    for(int i = 0;i<brige.size()-1;i+=1)
    {
        Ball node1 = brige.get(i);
        Ball node2 = brige.get(i+1);
        
        DistanceJointDef djd = new DistanceJointDef();
        djd.bodyA = node1.body;
        djd.bodyB = node2.body;

        djd.length = box2d.scalarPixelsToWorld(len);
        djd.frequencyHz = 0;
        djd.dampingRatio = 0.5;
        
        DistanceJoint dj = (DistanceJoint) box2d.world.createJoint(djd);
    }
  }
  
  void createBall()
  {
   for(int i = 0;i<=width;i+=15) 
   {
     if(i==0||i+15>width)
     brige.add(new Ball(i,y,true));
     else
     brige.add(new Ball(i,y,false));
   }
  }
  
  void display()
  {
    for(int i = 0;i<brige.size()-1;i++)
    {
       Ball node1 = brige.get(i);
       node1.display();
       
       Ball node2 = brige.get(i+1);
       node2.display();
     
       Vec2 pos1 = box2d.getBodyPixelCoord(node1.body);
       Vec2 pos2 = box2d.getBodyPixelCoord(node2.body);
       stroke(0);
       strokeWeight(3);
       line(pos1.x,pos1.y,pos2.x,pos2.y);
       
    }
  }
}