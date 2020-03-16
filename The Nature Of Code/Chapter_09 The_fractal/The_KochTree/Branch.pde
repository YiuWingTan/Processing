class Branch
{
  PVector start;
  PVector end;
  
  Branch(PVector a,PVector b)
  {
    start = a.get();
    end = b.get();
  }
  
  PVector getA(float len)
  {
    PVector direction = PVector.sub(start,end);
 
    float angle = direction.heading2D()+a;
    
    PVector A = new PVector(len*cos(angle),len*sin(angle));
    A = PVector.add(A,start);
    return A;
  }
  
  PVector getB(float len)
  {
    return start.get();
  }
  
  PVector getC(float len)
  {
    PVector direction = PVector.sub(start,end);
    
    float angle = direction.heading2D()-a;
    
    PVector C = new PVector(len*cos(angle),len*sin(angle));
    C = PVector.add(C,start);
    return C;
  }
  
  void display()
  {
     line(start.x,start.y,end.x,end.y); 
  }
}