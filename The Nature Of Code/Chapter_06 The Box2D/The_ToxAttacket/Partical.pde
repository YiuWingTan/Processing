class Particle extends VerletParticle2D
{
 
  Particle(Vec2D pos)
  {
    super(pos);
  }
  
  void display()
  {
    strokeWeight(2);
     stroke(0);
     ellipse(x,y,16,16);
  }
}