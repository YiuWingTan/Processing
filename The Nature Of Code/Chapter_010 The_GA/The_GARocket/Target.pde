class Target
{
   float r;
   PVector location;
   Target(float _r)
   {
     location = new PVector(width/2,height/2-400);
     r = _r;
   }
   
   void display()
   {
      fill(255,0,0);
      ellipse(location.x,location.y,r,r);
   }
   
   void setTarget(float x,float y)
   {
     location.set(x,y);
   }
   
   boolean contains(PVector v)
   {
     float dist = PVector.dist(v,location);
     if(dist<r)
     return true;
     return false; 
   }
}