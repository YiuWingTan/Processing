class Box  {
  float x;
  float y;
  float w=16;
  float h=16;
  Box(float x1,float y1){
    x=x1;
    y=y1;
  }
 void show(){
  rect(x,y,w,h);
  }
}