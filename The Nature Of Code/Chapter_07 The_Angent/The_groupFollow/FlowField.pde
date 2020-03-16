class FlowField
{
  ArrayList<PVector> flowFields;
  float r;
  
  FlowField(float _r)
  {
      r = _r;
      flowFields = new ArrayList<PVector>();
      PVector[]path = new PVector[6];
      path[0] = new PVector(100,100);
      path[1]= new PVector(1400,100);
      path[2] = new PVector(1400,900);
      path[3] = new PVector(750,900);
      path[4] = new PVector(100,900);
      path[5] = new PVector(100,100);
      for(int i = 0;i<path.length;i++)
      {
          flowFields.add(path[i]);
      }
  }
  
  void display()
  {
    noFill();
    stroke(175);
    strokeWeight(r*2);
    beginShape();
    for(PVector v:flowFields)
    vertex(v.x,v.y);
    endShape();
    
    stroke(0);
    strokeWeight(1);
    noFill();
    beginShape();
    for(PVector v:flowFields)
    vertex(v.x,v.y);
    endShape();
  }
  
  PVector getNormalPoint(PVector p,PVector a,PVector b)
  {
    PVector ap = PVector.sub(p,a);
    
    PVector ab = PVector.sub(b,a);
    
    ab.normalize();
    ab.mult(ap.dot(ab));
    
    PVector normalPoint = PVector.add(a,ab);
    return normalPoint;
  }
  
}