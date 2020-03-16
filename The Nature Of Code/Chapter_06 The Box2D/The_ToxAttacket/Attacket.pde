class Attacket extends VerletParticle2D
{
  float strength;
  float distance;
  float r;
  
   Attacket(Vec2D pos,float _r,float _distance,float _strength)
   {
      super(pos); 
      r = _r;
      distance = _distance;
      strength = _strength;
      physics.addBehavior(new AttractionBehavior2D(this,200,1));
      physics.addBehavior(new AttractionBehavior2D(this,100/2,-2));
   }
   
   void display()
   {
    stroke(0); 
    strokeWeight(3);
    fill(255,0,0);
    ellipse(x,y,r,r);
    noFill();
   }
}