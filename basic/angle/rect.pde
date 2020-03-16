class object
{
  PVector location;
  PVector speed;
  float angle=0;
  float av=0;
  float ajv=0.0001;
  object()
 {
   location=new PVector(random(1500),random(800));
   speed=new PVector(random(3),random(3));
 }
 void move()
 {
  
   angle=atan2(speed.y,speed.x);
   location.add(speed);
   
 }
 void show()
 {
   fill(175);
   stroke(0);
   rectMode(CENTER);
   pushMatrix();
   translate(location.x,location.y);
   rotate(angle);
   rect(0,0,16,16);
   popMatrix();
 }
 void text()
 {
  if(location.x<0){
   location.x=0+16;
   speed.x*=-1;
  }
  if(location.x>width){
   location.x=width-16;
   speed.x*=-1;
  }
  if(location.y<0){
   location.y=0+16;
   speed.y*=-1;
  }
  if(location.y>height){
   location.y=height-16;
   speed.y*=-1;
  }
 }
 void run()
 {
   text();
   move();
   show();
 }
}