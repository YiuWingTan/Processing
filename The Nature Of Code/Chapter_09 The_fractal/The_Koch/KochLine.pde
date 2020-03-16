class KochLine
{
  PVector start;
  PVector end;
  
  KochLine(PVector a,PVector b)
  {
     start = a.get();
     end = b.get();
  }
  
  void display()
  {
    stroke(0);
    line(start.x,start.y,end.x,end.y);
  }
  PVector KochA()
  {
    return start;
  }

  PVector KochB()
  {
    PVector len = PVector.sub(end,start);
    len.div(3);
    PVector b = PVector.add(start,len);
    return b;
  }

  PVector KochC()
  {
    PVector len = PVector.sub(end,start);
    len.div(3);
    PVector c = PVector.add(start,len);
    len.rotate(-radians(60));
    c.add(len);
    return  c;
  }

  PVector KochD()
  {
    PVector len = PVector.sub(end,start);
    len.mult(2/3.0);
    PVector D = PVector.add(start,len);
    return D;
  }

  PVector KochE()
  {
    return end;
  }
  
}