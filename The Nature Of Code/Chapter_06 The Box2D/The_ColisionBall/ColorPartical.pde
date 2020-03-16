class ColorPartical extends ObjectPartical
{
  ColorPartical(float x,float y,float r)
  {
   super(x,y,r);
   createBody();
   body.setUserData(this);
  }
  
  void changeColor()
  {
    col = color(255,0,0);
  }
}