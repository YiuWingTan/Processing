class Line
{
  PVector distance;
  PVector start;
  PVector end;
  
  Line(PVector a,PVector b)
  {
    start = a.get();
    end = b.get();
    distance = new PVector(0,15);
  }
  
  PVector getA()
  {
    PVector A = PVector.add(start,distance);
    return A;
  }
  
  PVector getB(){
    PVector len = PVector.sub(end,start);
    len.div(3);
    PVector B = PVector.add(len,start);
    B.add(distance);
    return B;
  }
  
  PVector getC(){
    PVector len = PVector.sub(end,start);
    len.div(3);
    len.mult(2);
    PVector C = PVector.add(start,len);
    C.add(distance);
    return C;
  }
  
  PVector getD()
  {
    PVector D = PVector.add(end,distance);
    return D;
  }
  
  void display()
  {
     stroke(0);
     line(start.x,start.y,end.x,end.y);
  }
}