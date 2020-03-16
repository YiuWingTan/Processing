ArrayList<Button> buttons;
PImage img1,img2,img3;
void setup()
{
  size(800,800);
  img1=loadImage("01.png");
  img2=loadImage("02.png");
  img3=loadImage("03.png");
  buttons=new ArrayList<Button>();
  buttons.add(new Button(img1,img2,img3,300,300,100,62));
}
void draw()
{
  if(buttons.get(0).check) background(0);
   else 
   background(255);



for(int i=buttons.size()-1;i>=0;i--)
   {
     Button b=buttons.get(i);
     if(b.pressed) b.display(PRESSED);
     else if(b.buttonOver()) b.display(OVER);
     else b.display(USU);
   }

}
void mousePressed()
{
//  particles.add(new Particle(mouseX,mouseY,30));//w,h,r
    
   for(int i=buttons.size()-1;i>=0;i--){
     Button b=buttons.get(i);
     if(b.buttonOver())
     {
       b.buttonPressed();
       break;
     }
   }
}

void mouseReleased()
{
  
   for(int i=buttons.size()-1;i>=0;i--){
     Button b=buttons.get(i);
     if(b.pressed) b.buttonReleased();
   }


}