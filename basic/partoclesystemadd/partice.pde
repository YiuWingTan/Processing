class particle
{
  PImage img;
  float life;
  PVector speed;
  PVector location;
  PVector wind;
  particle(PVector loc)
  {
    location=loc;
    life=200;
    img=loadImage("ball.png");
    float vx=randomGaussian()*0.3;
    float vy=randomGaussian()*0.3-1.0;
    speed=new PVector(vx,vy);
  }
}