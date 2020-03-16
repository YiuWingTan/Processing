class oscillator
{
 PVector angle;
 PVector aspeed;
 PVector amplitude;
 PVector location;
 oscillator()
 {
   location=new PVector(0,0);
   angle=new PVector(0,0);
   aspeed=new PVector(random(-0.1,0.1),random(-0.1,0.1));
   amplitude=new PVector(random(100,200),random(200,300));
 }
 void update()
 {
  angle.add(aspeed);
  location.x=amplitude.x*cos(angle.x);
  location.y=amplitude.y*cos(angle.y);
 }
 void display()
 {
   pushMatrix();
   translate(width/2,height/2);
   stroke(0);
   fill(175);
   line(0,0,location.x,location.y);
   ellipse(location.x,location.y,16,16);
   popMatrix();
   
 }
 void run()
 {
  update();
  display();
 }
}