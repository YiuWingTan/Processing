class Line
{
   PVector start;
   PVector end;
   
   Line(PVector a,PVector b)
   {
     start = a.get();
     end = b.get();
   }
   
   void display()
   {
     line(start.x,start.y,end.x,end.y);
   }
   
    PVector getDirection()
    {
       PVector direction = PVector.sub(end,start); 
       direction.normalize();
       return  direction;
    }
    
    PVector getStart()
    {
       return start.get(); 
    }
    
    PVector getEnd()
    {
       return end.get(); 
    }
}