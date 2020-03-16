class World
{
  ArrayList<Bloop> bloop;
  ArrayList<Food> foods;
  
  World()
  {
    bloop = new ArrayList<Bloop>();
    foods = new ArrayList<Food>();
    for(int i = 0;i<20;i++)
    {
       if(i<10){
          foods.add(new Food()); 
       }
       DNA d = new DNA();
       Bloop p = new Bloop(d);
       bloop.add(p);
    }
  }
  
  void run()
  {
    for(Food f:foods)
    f.display();
    
    
    for(int i = 0;i<bloop.size();i++)
    {
        Bloop p = bloop.get(i);
        if(!p.isDead()){
          p.run();
          p.eat(foods);
          Bloop child = p.reproduct(0.01);
          if(child!=null) bloop.add(child);
        }else
        {
            bloop.remove(p);
            i--;
        }
    }
  }
  
   
}