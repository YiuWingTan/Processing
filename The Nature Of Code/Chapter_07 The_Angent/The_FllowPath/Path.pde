class Path
{
  PVector startPoint;
  PVector endPoint;
  float r;
  
  Path(float _r)
  {
    setUp();
    r = _r;
  }
  
  PVector getNormalPoint(PVector predictLoc,PVector _path)
  {
    PVector pathLoc = _path.get();
    pathLoc.normalize();
    PVector a = PVector.sub(predictLoc,startPoint);
    float l = a.dot(pathLoc);
    pathLoc.mult(l);
    return PVector.add(startPoint,pathLoc);
  }
  
  void setUp()
  {
     startPoint = new PVector(0,random(50,height-50));
     endPoint = new PVector(width,random(50,height-50));
  }
  
  void display()
  {
    strokeWeight(r*2);
    stroke(0,100);
    line(startPoint.x,startPoint.y,endPoint.x,endPoint.y);
    
    strokeWeight(1);
    stroke(0);
    line(startPoint.x,startPoint.y,endPoint.x,endPoint.y);
  }
}