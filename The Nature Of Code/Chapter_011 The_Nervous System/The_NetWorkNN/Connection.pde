class Connection
{
   Neuron a;
   Neuron b;
   float weight;
   ArrayList<Sender> senders;
   
   Connection(Neuron _a,Neuron _b,float _w)
   {
     a = _a;
     b = _b;
     weight = _w;
     senders = new ArrayList<Sender>();
   }
   
   void display()
   {
     pushMatrix();
     //translate(width/2,height/2);
     stroke(0);
     strokeWeight(weight*4);
     line(a.location.x,a.location.y,b.location.x,b.location.y);
     noStroke();
     
     for(int i = 0;i<senders.size();i++)
     {
        Sender s = senders.get(i);
         s.display();
         if(s.getDistance()<1){
           senders.remove(s);
           b.feedforward(s.sendingData);
         }
     }
     
     popMatrix();
   }
   
   void feedforward(float val)
   {
     Sender s = new Sender(a.location,b.location,val*weight);
     senders.add(s);
   }
}