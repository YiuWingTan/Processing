class DeadPartical extends ObjectPartical
{
  DeadPartical(float x,float y,float r)
  {
    super(x,y,r); 
    createBody();
    body.setUserData(this);
  }
  
  void destroy()
  {
    isDead = true;
  }
  
  
}