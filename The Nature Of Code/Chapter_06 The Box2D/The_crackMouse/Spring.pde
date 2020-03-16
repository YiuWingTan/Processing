class Spring 
{
  Box box;
  MouseJoint mouseJoint;
  Vec2 mousePosition;
  boolean isSet;
  Spring(Box _box)
  {
   box = _box;
   mouseJoint = null;
  }
  
  void Link()
  {
    if(mouseJoint==null)
    {
      MouseJointDef md = new MouseJointDef();
    md.bodyA = box2d.getGroundBody();
    
    md.bodyB = box.body;
    Vec2 mp = box2d.coordPixelsToWorld(mouseX,mouseY);
    // And that's the target
    md.target.set(mp);
    // Some stuff about how strong and bouncy the spring should be
    md.maxForce = 1000.0 * box.body.m_mass;
    md.frequencyHz = 5.0;
    md.dampingRatio = 0.9;
    mouseJoint = (MouseJoint) box2d.world.createJoint(md);
    }
  }
    
  
  void display()
  {
    if(mouseJoint!=null)
    {
      Vec2 v1 = new Vec2(0,0);
      mouseJoint.getAnchorA(v1);
      Vec2 v2 = new Vec2(0,0);
      mouseJoint.getAnchorB(v2);
      // Convert them to screen coordinates
      v1 = box2d.coordWorldToPixels(v1);
      v2 = box2d.coordWorldToPixels(v2);
      // And just draw a line
      stroke(0);
      strokeWeight(1);
      line(v1.x,v1.y,v2.x,v2.y);
      stroke(0);
      strokeWeight(4);
      line(v1.x,v1.y,v2.x,v2.y);
    }
  }
  
  void setTarget(float mousex,float mousey)
  {
    Vec2 mouse = box2d.coordPixelsToWorld(mousex,mousey);
    mouseJoint.setTarget(mouse);
    isSet = true;
  }
  
  void destroyTarget()
  {
    if(mouseJoint!=null)
    {
       box2d.world.destroyJoint(mouseJoint); 
       mouseJoint = null;
       
    }
  }
  
  void update()
  {
     if(mouseJoint!=null)
     {
        mouseJoint.setTarget(box2d.coordPixelsToWorld(mouseX,mouseY)); 
     }
  }
  
}