ArrayList<Box> boxes;
int i=0;
void setup()
{
 size(800,800);
 background(0);
 boxes=new ArrayList<Box>();
}
void draw()
{
 if(mousePressed){
 Box p=new Box(mouseX,mouseY);
 boxes.add(p);
 boxes.get(i).show();
 i++;
 }
 
}