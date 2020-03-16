class Particel extends VerletParticle2D
{
  Particel(Vec2D pos)
  {
    super(pos);
  }
  
  void display()
  {
     fill(2);
     ellipse(x,y,16,16);
     noFill();
  }
}