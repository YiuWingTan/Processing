class Partical extends VerletParticle2D
{
 Partical(Vec2D pos)
 {
   super(pos);
 }
 
 void display()
 {
   //ill(150);
   stroke(0);
   //strokeWeight(2);
   ellipse(x,y,16,16);
   //noFill();
 }
}