PVector limit;
ArrayList<PVector> points = new ArrayList<PVector>();
void setup()
{
  limit = new PVector(300,300);
  background(255);
  size(1000,800);
  CreatePoints(20);
  print("The min distance of this points is",FindMin());
}

void CreatePoints(int n)
{
  for(int i=0;i<n;i++)
  {
    PVector location = new PVector(width/2+random(-limit.x,limit.x),height/2+random(-limit.y,limit.y));
    ellipse(location.x,location.y,5,5);
    points.add(location);
  }
}

float FindMin()
{
  float distance = 0;
  for(int i=0;i<points.size();i++)
  {
   for(int j=0+i;j<points.size()-1;j++)
   {
     float setoff = PVector.sub(points.get(j),points.get(j+1)).mag();
     if(setoff>distance)
     {
      distance = setoff;
     }
   }
  }
  return distance;
}