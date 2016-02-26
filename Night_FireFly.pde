
//objects
Background bg;
FireFly firefly;
Stars stars;
Grass grass;

//image file
PImage img;
float x=0;

void setup(){
  size(800,550, P2D);
  
  bg= new Background();
  firefly= new FireFly();
  stars= new Stars();
  grass=new Grass();
}

void draw()
{
  bg.draw();
  stars.draw(); 
  firefly.draw();
  

  //create dirt ground
  noStroke();
  fill(#5A3D06,255);
  rect(0,height-25, width, height-25);
  //create water
  noStroke();
  fill(#3263AF,255);
  rect(0,height-35, width,25);
  
  grass.draw();