class Steper
{
   float x;
   float y;
   float setOffX;
   float setOffY;
   Steper()
   {
   x = width/2;
   y = height/2;
   setOffX = random(0,10000);
   setOffY = random(0,10000);
   }
    
   void step()
   {
      x+=map(noise(setOffX),0,1,-10,10);
      y+=map(noise(setOffY),0,1,-10,10);
      setOffX+=0.001;
      setOffY+=0.001;
   }
   
   void display()
   {
     background(255);
     fill(0);
     ellipse(x,y,25,25);
   }
   
}