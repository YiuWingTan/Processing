class Turtle
{
  String todo;
  float len;
  float angle;
  
  Turtle(String _todo,float _len,float _angle)
  {
    todo = _todo;
    len = _len;
    angle = _angle;
  }
  
  void render()
  {
     fill(0,45,0);
    stroke(0, 175);
    for (int i = 0; i < todo.length(); i++) {
      char c = todo.charAt(i);
      if (c == 'F' || c == 'G') {
        line(0, 0,0,-len);
        translate(0,-len);
      } else if (c == '+') {
        rotate(angle);
      } else if (c == '-') {
        rotate(-angle);
      } else if (c == '[') {
        pushMatrix();
      } else if (c == ']') {
        popMatrix();
      }
    }
  }
  
  void setLen(float _len)
  {
    len = _len;
  }
  
  void changeLen(float p)
  {
    len*=p;
  }
  
  void setToDo(String s)
  {
    todo = s;
  }
}