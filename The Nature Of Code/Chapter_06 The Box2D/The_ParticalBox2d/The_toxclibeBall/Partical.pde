class Partical extends VerletParticle2D
{
  Partical(Vec2D pos)
  {
   super(pos); 
  }
  
  void display()
  {
   fill(175);
   stroke(0);
   strokeWeight(3);
   ellipse(x,y,16,16);
   noFill();
  }
}