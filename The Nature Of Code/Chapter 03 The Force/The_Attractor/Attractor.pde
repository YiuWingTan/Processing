class Attractor
{
  PVector location;
  float mass;
  float r;
  float G;
  Attractor()
  {
    location = new PVector(width/2,height/2);
    G = 2;
    r = 100;
    mass = 20;
  }
  
  PVector Attaract(Mover mover)
  {
    PVector force = PVector.sub(location,mover.location);
    float distance = force.mag();
    force.normalize();
    distance = constrain(distance,5,25);
    //limit the distance between the Attactor and mover
    float mag = (G*mass*mover.mass)/(distance*distance);
    force.mult(mag);
    return force;
  }
  // count the force of Attactor and the mover
  
  void Display()
  {
    fill(145,55,214);
    ellipse(location.x,location.y,mass*16,mass*16);
    noFill();
  }
}