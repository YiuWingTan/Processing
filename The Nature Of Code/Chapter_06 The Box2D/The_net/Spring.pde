class Spring extends VerletSpring2D
{

  Spring(Partical p1,Partical p2,float len,float strength)
  {
    super(p1,p2,len,strength);
  }
  
  void display()
  {
    stroke(0);
    //strokeWeight(2);
    line(a.x,a.y,b.x,b.y);
  }
}