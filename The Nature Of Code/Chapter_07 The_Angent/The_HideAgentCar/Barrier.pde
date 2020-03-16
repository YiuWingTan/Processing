class Barrier
{
  ArrayList<PVector> barrier;
  float r;
  
  Barrier(float _r,PVector []positions)
  {
     barrier = new ArrayList<PVector>();
     r = _r;
     for(int i =0;i<positions.length;i++)
     {
       PVector pos = positions[i];
       barrier.add(pos);
     }
  }
  
  void display()
  {
    fill(0);
    
   for(PVector location:barrier)
   {
     pushMatrix();
     translate(location.x,location.y);
     ellipse(0,0,3,3);
     line(0,0,r,0);
     line(0,0,-r,0);
     line(0,0,0,r);
     line(0,0,0,-r);
     popMatrix();
   }
   
   noFill();
    
  }
}