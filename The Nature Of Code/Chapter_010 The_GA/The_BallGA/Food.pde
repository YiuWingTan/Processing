class Food
{
   PVector location;
   PVector velocity;
   float setx;
   float sety;
   
   Food()
   {
     
      location = new PVector(random(50,width-50),random(50,height-50)); 
   }
   
   void display()
   {
     fill(255,0,0);
     rect(location.x,location.y,5,5);
     noFill();
   }
   
   void update()
   {
       float x = map(noise(setx),0,1,-5,5);
       //float y = map();
   }
   
   void edge()
   {
     
   }
   
   void run()
   {
     display();
   }
}