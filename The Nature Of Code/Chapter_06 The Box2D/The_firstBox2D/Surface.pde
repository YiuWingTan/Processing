class Surface
{
  ArrayList<Vec2> surface;
  Body body;
  Surface()
  {
    BodyDef bd = new BodyDef();
    body = box2d.createBody(bd);
    ChainShape ps = new ChainShape();
    
    surface = new ArrayList<Vec2>();
    surface.add(new Vec2(0,height/2+50));
    surface.add(new Vec2(width/2,height/2+50));
    surface.add(new Vec2(width,height/2));
    Vec2[] vertics = new  Vec2[surface.size()];
    for(int i = 0;i<vertics.length;i++)
    {
      vertics[i] = box2d.coordPixelsToWorld(surface.get(i));
    }
    ps.createChain(vertics,vertics.length);
    body.createFixture(ps,1);
  }
  
  
  void  display()
  {
   strokeWeight(1);
   stroke(0);
   fill(0);
   beginShape();
   for(Vec2 v:surface)
   {
    vertex(v.x,v.y); 
   }
   vertex(width,height);
   vertex(0,height);
   endShape(CLOSE);
  }
}