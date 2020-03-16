gratity ball;
float r=80;
void setup()
{
  size(1500,900);
  fill(0);
  ball=new gratity(); 
  fill(0);
  noStroke();
  smooth();
}
  void draw()
{
    background(255);
    ball.location_deal();
    ball.gratity_deal();
    ball.show();
    
}