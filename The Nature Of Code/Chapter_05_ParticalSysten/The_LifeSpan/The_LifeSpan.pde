PVector gravity;
ArrayList<partical> particals;
void setup()
{
  size(1000,800);
  gravity = new PVector(0,0.2);
  particals = new ArrayList<partical>();
  for(int i=0;i<10;i++)
  {
     particals.add(new partical(new PVector(width/2,height/2-300))); 
  }
}


void draw()
{
  background(255);
  for(int i =0;i<3;i++)
  particals.add(new partical(new PVector(width/2,height/2-300)));
  for(int i=0;i<particals.size();i++)
  {
      partical p = particals.get(i);
      p.applyForce(gravity);
      p.update();
      p.Display();
      if(p.isDead())
      {
       particals.remove(i);
       i--;
      }
  }
}


/*void draw()
{
  background(255);
  for(int i =0;i<3;i++)
  particals.add(new partical(new PVector(width/2,height/2-300)));
  Iterator<partical> it = particals.iterator();
}*/