class Car
{
  Object body;
  Object leftWheel;
  Object rightWheel;
  float x;
  float y;
  
   Car(float _x,float _y)
   {
     x = _x;
     y = _y;
     body = new Object(x,y,100,30,true);
     leftWheel = new Object(x-28, y+16, 12,false);
     rightWheel = new Object(x+28, y+16, 12,false);
     createLink();
   }
   
   void display()
   {
     body.display();
     leftWheel.display();
     rightWheel.display();
   }
   
   void createLink()
   {
     RevoluteJointDef rjd = new RevoluteJointDef();
     rjd.initialize(body.body,leftWheel.body,leftWheel.body.getWorldCenter());
     rjd.motorSpeed = -PI*3;
     rjd.maxMotorTorque =300.0;
     rjd.enableMotor = true;
     box2d.createJoint(rjd);
     
     RevoluteJointDef rjd2 = new RevoluteJointDef();
     rjd2.initialize(body.body,rightWheel.body,rightWheel.body.getWorldCenter());
     rjd2.motorSpeed = -PI*3;
     rjd2.maxMotorTorque =300.0;
     rjd2.enableMotor = true;
     box2d.createJoint(rjd2);
   }
}