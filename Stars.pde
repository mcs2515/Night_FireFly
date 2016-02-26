
class Stars
{
  int points=1000;
  float speedX;
  float speedY;
  
  //array of stars
  float[] starX;
  float[] starY;
  float[] starZ;
  
  Stars()
  {
    speedX=0;
    speedY=0;
    //initialize arrays
    starX= new float[points];
    starY= new float[points];
    starZ= new float[points];
    
    for(int i=0; i<starX.length; i++)
    {
      //set each star's x,y, z coordinates relative to the screen size
      starX[i]=random(width+50);
      starY[i]=random(height+20);
      //store the gray value
      starZ[i]=random(255);
    }
  }
  
  void draw()
  {
    for(int i=0;i<starX.length;i++)
    {
      //give each star different gray color
      stroke(starZ[i]+50);
      
      //draw points to screen using the stored coordinates
      point(starX[i],starY[i]);
      //move the stars to the left
      starX[i]+=speedX;
      
      //wrap the stars on screen if they go off
      if(starX[i]<=0.0)
      {
        starX[i]=width;
      }
    }
    //move the stars to the left
    speedX=-(.1);    
  }