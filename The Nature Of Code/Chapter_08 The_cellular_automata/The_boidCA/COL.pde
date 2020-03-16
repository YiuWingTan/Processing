class COL
{
    ArrayList<Boid> boids;
    float distance;
    
    COL(float _distance)
    {
      distance = _distance;
      boids = new ArrayList<Boid>();
    }
    
    void addBoid()
    {
       for(int i =0;i<12;i++)
       {
          boids.add(new Boid(4,4,0.2,50,100,200)); 
       }
    }
    
    void bump()
    {
       int number = boids.size();
       for(int i = 0;i<number;i++)
       {
           for(int j =i;j<number;j++)
           {
               float dist = PVector.dist(boids.get(i).location,boids.get(j).location);
               if(dist<distance)
               check(i,j);
           }
       }
    }
    
    void check(int x,int y)
    {
      //println("goin");
      Boid b = boids.get(x);
      Boid p = boids.get(y);
      boolean bf = false;
      boolean pf = false;
      if(b.state==0)
      {
        int i = 0;
        boolean exist = false;
        for(;b.record[i]!=-1;i++)
        {
          if(b.record[i] == y){exist = true;break;}
        }
        if(!exist){b.record[i] = y;}
        if(b.record[2]!=-1) bf = true;
      }
      
      if(p.state==0)
      {
        int i = 0;
        boolean exist = false;
        for(;p.record[i]!=-1;i++)
        {
          if(p.record[i] == x){exist = true;break;}
        }
        if(!exist){p.record[i] = x;}
        if(p.record[2]!=-1) pf = true;
      }
      
      if(bf){boids.get(x).setState(true);}
      if(pf){boids.get(y).setState(true);}
    }
    
    void display()
    {
       for(Boid b:boids)
       {
          b.run(boids); 
       }
    }
}