class Graph
{
    float []mesh;
    float offset;
 Graph()
 {
   
    mesh = new float[20];
    offset = width/20;
 }
 
 void step()
 {
    int index = int(random(mesh.length)); 
    mesh[index]+=2;
 }
 
 void display()
 {
   background(255);
   fill(125);
   for(int i=0;i<mesh.length;i++)
   {
     rect(0+i*offset,height-mesh[i],offset,mesh[i]);
   }
 }
}