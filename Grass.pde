
class Grass
{
  //image file
  PImage img;
  
  ArrayList<PImage> grass;
  int [] xValues;
  int [] yValues;
  int random;
  float grassRandom;

  Grass()
  {
    //initialize list of PImages
    grass=new ArrayList<PImage>();
    
    //load image
    
    img=loadImage("grass.png"); 
       
    //choose a random #
    random= (int)random(5, 11);    
    //make that much amount of grass images
    for(int i=0; i<random; i++)
    {
      //and add to the Pimage list
      grass.add(img);
    }
    
    //make that much mount of x & y coordinates
    xValues=new int[random];
    yValues=new int[random];
    
    //and add the x and y coordinates to the int array
    for(int i=0; i<random; i++)
    {
      grassRandom= random(1);
      //use directed random to set the x and y coordinates
      if(grassRandom<.33)
      {
        xValues[i]=100*i;
        yValues[i]=height-img.height+10;
      }    
      else if(grassRandom<.66)
      {
        xValues[i]=-30*i;
        yValues[i]=height-img.height+80;
      }
      else
      {
        xValues[i]=25*i;
        yValues[i]=height-img.height+35;
      }
    }  
  }
  
  void draw()
  {
    for(int i=0; i< random; i++)
    {      
      //load image in
      image(grass.get(i), xValues[i], yValues[i]);
      
      //wrap the grass if they go off screen           
      if(xValues[i]<=-img.width-20)
      {
        xValues[i]=width;
      }
      
      //move the grass to the left
      xValues[i]-=5; 
    }
  }