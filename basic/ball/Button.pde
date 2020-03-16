static final int USU=0;
static final int OVER=1;
static final int PRESSED=2;
class Button
{
  float x,y,w,h;
  boolean check,pressed;
  PImage imageU,imageO,imageP;
  Button(PImage imageU_,PImage imageO_,PImage imageP_,float x_,float y_, float w_, float h_) 
  {
    imageU=imageU_;
    imageO=imageO_;
    imageP=imageP_;
    x=x_;
    y=y_;
    w=w_;
    h=h_;
    check=pressed=false;
  }
  void buttonPressed()
  {
    pressed=true;
    display(PRESSED);
  }
  
  boolean buttonOver()
  {
    if(mouseX>=x&&mouseX<=x+w&&mouseY>=y&&mouseY<=y+h) return true;
    return false;
  }
  void buttonReleased()
  {
    pressed=false;
    if(buttonOver())
    {
      if(check) check=false;
      else check=true;
    }
  }
  void buttonMove(float moveToX,float moveToY)
  {
    x=moveToX;
    y=moveToY;
  }
  void display(int v)
  {
    if(v==USU) image(imageU,x,y,w,h);
    if(v==PRESSED) image(imageP,x,y,w,h);
    if(v==OVER) image(imageO,x,y,w,h);
  }
}