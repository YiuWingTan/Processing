class attrach_drage
{
  float i;
  attrach_drage()
  {
   
  }
  
  PVector attrach(float dist,Be_attrach_ball ball1,attrach_ball ball2)
  {
    dist=constrain(dist,5,25);
    PVector F=ball1.location1.get();
    F.sub(ball2.location2);
    F.normalize();
    i=(ball1.mass*ball2.mass)/(dist*dist);
    F.mult(i);
    return F;
  }
}