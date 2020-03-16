class Cell
{
  PVector left;
  PVector right;
  float h;
  float w;
  int state;
  int previous;
  
  Cell(float _h,float _w,PVector _left,PVector _right)
  {
    w = PVector.dist(_left,_right);
    h = _h;
    left = _left;
    right = _right;
  }
  
  void set()
  {
     previous =state = (int)random(2);
  }
  void display()
  {
    stroke(0);
    strokeWeight(2);
    if(previous==0&&state==1)
    {
     fill(0,0,255);
     // to set bule
    }else if(state==1){
      fill(0);
      //to set black
    }else if(previous==1&&state==0)
    {
      fill(255,0,0);
      //to set red
    }else 
    fill(255);
    pushMatrix();
    translate(left.x,left.y);
    beginShape();
    vertex(0,0);
    vertex(w/2,0);
    vertex(w/2+w/4,h/2);
    vertex(w/2,h);
    vertex(0,h);
    vertex(-w/4,h/2);
    endShape(CLOSE);
    popMatrix();
  }
  
  void setState(int _state)
  {
    previous = state;
    state = _state;
  }
}