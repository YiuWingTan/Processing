class Edge
{
  float xEdge;
  float yEdge;
  
   Edge(float up,float left )
   {
     xEdge = left;
     yEdge = up;
   }
   
   void display()
   {
     fill(250);
     strokeWeight(3);
     beginShape();
     vertex(xEdge,yEdge);
     vertex(width-xEdge,yEdge);
     vertex(width-xEdge,height-yEdge);
     vertex(xEdge,height-yEdge);
     endShape(CLOSE);
     noFill();
   }
}