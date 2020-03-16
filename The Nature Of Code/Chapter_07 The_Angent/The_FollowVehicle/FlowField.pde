class FlowField
{
  PVector [][]field;
  int clos,rows;
  int resolution;
  float setz;
  
  FlowField()
  {
     resolution = 20;
     clos = width/resolution;
     rows = height/resolution;
     field = new PVector[clos][rows];
     init();
  }
  
  void init()
  {
   float setx = 0;
   for(int i = 0;i<clos;i++)
   {
     float sety = 0;
      for(int j = 0;j<rows;j++)
      {
        float angle = map(noise(setx,sety),0,1,0,TWO_PI);
        field[i][j] = new PVector(cos(angle),sin(angle));
        sety+=0.1;
      }
      setx+=0.1;
   }
  }
  
  void update()
  {
      float setx = 0;
      for(int i = 0;i<clos;i++)
      {
        float sety = 0;
         for(int j = 0;j<rows;j++)
         {
           float angle = map(noise(setx,sety,setz),0,1,0,TWO_PI);
           field[i][j].set(cos(angle),sin(angle));
           sety+=0.1;
         }
         setx = 0.1;
      }
      setz+=0.01;
  }
  
  PVector lookup(PVector lookup)
  {
    int x = int(constrain(lookup.x/resolution,0,clos-1));
    int y = int(constrain(lookup.y/resolution,0,rows-1));
    return field[x][y].get();
  }
  
  void display() {
    for (int i = 0; i < clos; i++) {
      for (int j = 0; j < rows; j++) {
        drawVector(field[i][j],i*resolution,j*resolution,resolution-4);
      }
    }

  }
  
  void drawVector(PVector v, float x, float y, float scayl) {
    pushMatrix();
    float arrowsize = 2;
    // Translate to position to render vector
    translate(x,y);
    stroke(0,150);
    // Call vector heading function to get direction (note that pointing up is a heading of 0) and rotate
    rotate(v.heading2D());
    // Calculate length of vector & scale it to be bigger or smaller if necessary
    float len = v.mag()*scayl;
    // Draw three lines to make an arrow (draw pointing up since we've rotate to the proper direction)
    line(0,0,len,0);
    line(len,0,len-arrowsize,+arrowsize/2);
    line(len,0,len-arrowsize,-arrowsize/2);
    popMatrix();
  }
}