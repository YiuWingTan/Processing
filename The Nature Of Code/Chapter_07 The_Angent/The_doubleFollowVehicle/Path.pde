class Path
{
  ArrayList<PVector> paths;
  float r;
  
  Path(float _r)
  {
    r = _r;
    paths = new ArrayList<PVector>();
    startUp();
  }
  
  void display()
  {
    stroke(175);
    strokeWeight(r*2);
    noFill();
    beginShape();
    for(PVector v:paths)
    {
      vertex(v.x,v.y);
    }
    endShape();
    
    stroke(0);
    strokeWeight(1);
    noFill();
    beginShape();
    for(PVector v:paths)
    {
     vertex(v.x,v.y); 
    }
    endShape();
  }
  
  void startUp()
  {
    int number = (int)random(3,7);
    PVector[] points = new PVector[number];
    points[0] = new PVector(0,random(50,height-50));
    points[number-1] = new PVector(width,random(50,height-50));
    for(int i = 1;i<number-1;i++)
    {
       points[i] = new PVector(random(100,width-100),random(50,height-50));
    }
    //create the point in the map
    
    for(int i = 1;i<number-1;i++)
    {
      int mark = i;
      float x = points[i].x;
       for(int j = 1+i;j<number-1;j++)
       {
         if(points[j].x<x)
         {
            x = points[j].x;
            mark = j;
         }
       }
       PVector node = points[i];
       points[i] = points[mark];
       points[mark] = node;
    }
    
    for(int i=0;i<number;i++)
    {
       paths.add(points[i]); 
    }
  }
  
  PVector getNormalPoint(PVector preLoc,PVector a,PVector b)
  {
    PVector loc = PVector.sub(preLoc,a);
    PVector path = PVector.sub(b,a);
    path.normalize();
    float x = loc.dot(path);
    path.mult(x);
    return PVector.add(path,a);
  }
  
  
}