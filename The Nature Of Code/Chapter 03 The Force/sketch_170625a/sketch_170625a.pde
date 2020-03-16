ArrayList<PVector> points = new ArrayList<PVector>();
void setup()
{
  size(1000,800);
  ellipse(width/2,height/2,500,500);
  rand(10,0.3);
}

void rand(int n,float p)
{
  PVector location = PVector.add(new PVector(width/2,height/2),SortLocation(250,true));
  ellipse(location.x,location.y,2,2);
  points.add(location);
  float len = random(5,26);
  for(int i =0;i<n-1;i++){
    PVector loca = new PVector(0,0);
    int number = (int)random(0,points.size());
    do{
      loca = PVector.add(SortLocation(150,false),points.get(0));
      print("loop");
    }while(!isOK(loca));
    fill(0);
    ellipse(loca.x,loca.y,2,2);
    points.add(loca);
    //get the location
  }
  DrawLine(p);
}

PVector SortLocation(float len,boolean mode)
{
  float x = random(-len,len);
  float mag = len*len - x*x;
  float setOff = sqrt(mag);
  float y = 0;
  if(mode == true)
  y = random(-setOff,setOff);
  else
  {
    float p = random(0,1);
    if(p<0.5) p = 1;
    else p = -1;
    y = setOff*p;
  }
  
  PVector location = new PVector(x,y);
  return location;
}
//Calculates the setoff of the vaule of location

boolean isOK(PVector location)
{
  PVector iniLocation = new PVector(width/2,height/2);
  float mag = PVector.sub(location,iniLocation).mag();
  if(mag>250) return false;
  return true;
}
//check is out of range


void DrawLine(float p)
{
  for(int i=0;i<points.size();i++)
  {
    for(int j=0+i;j<points.size()-1;j++)
    {
      float n = random(0,1);
      if(n>p)
      {
        line(points.get(j).x,points.get(j).y,points.get(j+1).x,points.get(j+1).y);
      }
    }
  }
}