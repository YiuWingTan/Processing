class Cube
{
   ArrayList<Partical> particals = new ArrayList<Partical>();
   PVector location;
   float h;
   float w; 
   boolean isDown;
   Cube(PVector loca,float _w,float _h)
   {
     location = loca.get();
     w = _w;
     h = _h;
     isDown = false;
     for(int i=0;i<=w;i+=5)
     {
        for(int j=0;j<=h;j+=5)
        {
         particals.add(new Partical(new PVector(location.x+i,location.y+j))); 
        }
     }
   }
   
   void cubeDown(boolean _isDown)
   {
     isDown = _isDown;
     if(isDown)
     {
      Force.gravity = new PVector(0,0.2);
      for(int i = 0;i<particals.size();i++)
      {
        Partical p = particals.get(i);
        p.velocity.set(random(-2,2),random(-3,3));
      }
     }
   }
   
   
   void display()
   {
     for(int i = 0;i<particals.size();i++)
     {
       Partical node = particals.get(i);
       if(node.run())
       {
         particals.remove(i);
         i--;
       }
     }
   }
   
}