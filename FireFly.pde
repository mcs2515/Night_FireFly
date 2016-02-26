class FireFly
{
  //attributes
  PShape firefly;
  PShape body;
  PShape bWing;
  PShape fWing;
  color c1;
  color c2;
  float time;
  PImage glow;
  PGraphics blur;
  
  float yDistrib;
  float xDistrib;
  float bWingRot;
  float fWingRot;
  
  boolean wingUp;
  
  FireFly()
  {
    //initialize the blur graphics
    blur=createGraphics(200,200);    
    
    //set initial attribute values
    c1=#F5E17C;  //body color
    c2=#F2E9BC;  //wing color    
    yDistrib=0;  //used for perlin noise Y-comp
    xDistrib=0;  //used for perlin noise X-comp
    bWingRot=5;  //rotates back wings
    fWingRot=5;  //rotates front wings
    
    wingUp=true;
    time=0;
    
    //set stroke color to all shapes
    stroke(#CEAA06);
    
    //parent
    firefly= createShape(GROUP);
    
    //create body
    body= createShape(ELLIPSE, 0, 0, 35,35);    
    body.setFill(c1);    
    //create the back wings
    bWing=createShape(ELLIPSE, -20, -10, 50,20);
    bWing.setFill(c2);
    //create the front wings
    fWing=createShape(ELLIPSE, -20, 0, 50,20);
    fWing.setFill(c2);   
    
    //add the parts to parent
    firefly.addChild(bWing);  //0
    firefly.addChild(body);   //1    
    firefly.addChild(fWing);  //2
    
    //create a circle that has blur
    blur.beginDraw();
    blur.fill(255, 147);
    blur.noStroke();
    blur.ellipse(100,100,110,110);
    blur.filter(BLUR,20); 
    blur.endDraw();
    
    //store the blur as an image
    glow= blur.get();
  }
  
  void draw()
  {    
    //firefly y-movement using perling noise
    float yMove= noise(yDistrib)*height;
    //makes sure that the firfly does not fly too low
    float yMapped=map(yMove, 0, height, 0,300);
    //firefly x-movement using perling noise
    float xMove= noise(xDistrib)*width;
    
    //draw the glow
    image(glow, xMove-100,yMapped-100);
    //draw the firefly
    shape(firefly, xMove, yMapped); 
    
    //transform back and front wings
    pushMatrix();
      firefly.getChild(0).rotate(radians(bWingRot));
      firefly.getChild(2).rotate(radians(fWingRot));
    popMatrix(); 
 
    //check for time >6
    if(time>=3)
    {      
      wingUp=false;  //change the direction of rotation
      bWingRot=-4;
      fWingRot=3;
      time-=.5;      //decrease time
    }
    
    //check for time <0
    if(time<=0)
    {
      wingUp=true;  //change the direction of rotation
      bWingRot=4; 
      fWingRot=-3;
      time+=.5;    //increase time
    }
    
    //check for time between 0 and 6
    if(time>=0 && time<=6)
    {
      if(wingUp)  //if the wing was already going up, keep moving upwards
      {
        time+=.5;
      }
      else
      {
        time-=.5; //vise versa
      }
    }
    
    //print time
     println(time);
    
    //increase the distributation
    yDistrib+=.01;
    xDistrib+=.003;    
  }
}