class Turtle
{
  ArrayList<Line> tree;
  String todo;
  float len;
  float angle;
  int i;
  boolean firsteep = false;
  
  Turtle(String _todo,float _len,float _angle)
  {
    i = 0;
    tree = new ArrayList<Line>();
    PVector start = new PVector(width/2,height);
    PVector end = new PVector(width/2,height-100);
    Line l = new Line(start,end);
    tree.add(l);
    todo = _todo;
    len = _len;
    angle = _angle;
  }
  
  void render()
  {
    for(Line l:tree)
    {
       l.display(); 
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
  
  void setTodo(String s)
  {
    todo = s;
  }
  
  void generateLine(float roate,Line father)
  {
    PVector start = new PVector();
    PVector end = new PVector();
    for(;i<todo.length()&&todo.charAt(i)!=']';i++)
    {
        char str = todo.charAt(i);
        if(!firsteep)
        {
            start.set(width/2,height);
            end.set(width/2,height-len);
            Line l = new Line(start,end);
            tree.add(l);
            firsteep = true;
            father = l;
        }else
        {
            if(str=='+'){
               roate+=angle;
            }else if(str=='-'){
              roate-=angle;
            }else if(str=='F'){
               float a = father.getDirection().heading2D()+roate;
               PVector d = new PVector(len*cos(a),len*sin(a));
               start = father.getEnd();
               end = father.getEnd();
               end.add(d);
               Line l = new Line(start,end);
               tree.add(l);
               father = l;
               roate= 0 ;
            }else if(str=='['){
              i++;
              generateLine(roate,father);
            }
        }
    }
  }

  void reSeti()
  {
    i = 0; 
    tree = new ArrayList<Line>();
    firsteep = false;
  }
}