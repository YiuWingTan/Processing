Oscillator oscillator;
void setup()
{
  size(1000,800);
  oscillator = new Oscillator();
}

void draw()
{
  background(255);
  oscillator.osillate();
  oscillator.Display();
}