Mover []mover = new Mover[10] ;
float attactorMass;
void setup()
{
  attactorMass = random(10,20);
  for(int i=0;i<mover.length;i++)
  {
   mover[i] = new Mover(); 
  }
  size(1000,800);
}

void draw()
{
  background(245);
  for(int i=0;i<mover.length;i++)
  {
    for(int j=0;j<mover.length;j++){
     if(j==i) continue;
     mover[i].ApplyForce(mover[j].Attaract(mover[i]));
    }
    mover[i].ApplyForce(MouseAttactor(mover[i]));
    mover[i].Update();
    mover[i].display();
    mover[i].CheckEdge(); 
  }
  
}


PVector MouseAttactor(Mover mover)
{
  float G = 10;
  PVector mouse = new PVector(mouseX,mouseY);
  PVector force = PVector.sub(mouse,mover.location);
  float distance = force.mag();
  distance = constrain(distance,5,25);
  force.normalize();
  float mag = (G*attactorMass*mover.mass)/(distance*distance);
  force.mult(mag);
  return force;
}
//calculate the AttractorForce of Mouse and the mover