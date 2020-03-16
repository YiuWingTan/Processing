class Surface
{
  ArrayList<Vec2>surface;
  Body body;
  Surface()
  {
    surface = new ArrayList<Vec2>();
    createObject();
  }
  
  void createObject()
  {
    BodyDef bd = new BodyDef();
    bd.type = BodyType.STATIC;
    body = box2d.createBody(bd);
    surface.add(new Vec2(0,height/2+50));
    surface.add(new Vec2(width/2,height/2+50));
    surface.add(new Vec2(width,height/2));
    Vec2 []vertices = new Vec2[surface.size()];
    for(int i = 0;i<vertices.length;i++)
    vertices[i] = box2d.coordPixelsToWorld(surface.get(i));
    ChainShape cs = new ChainShape();
    cs.createChain(vertices,vertices.length);
    FixtureDef fd = new FixtureDef();
    fd.shape = cs;
    body.createFixture(fd);
  }
  
  void display()
  {
     strokeWeight(2);
     stroke(0);
     fill(0);
     beginShape();
     for(Vec2 v:surface)
     vertex(v.x,v.y);
     vertex(width,height);
     vertex(0,height);
     endShape(CLOSE);
     noFill();
  }
}