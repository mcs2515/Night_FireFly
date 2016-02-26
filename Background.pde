
class Background
{ 
  //colors
  color blue;
  color white;
  color black;
  color purple;

   Background()
   {
  //cons     //set colors
      blue=#79ECFF;
      white= #FCFFFF;
      black=#000000;
      purple= #1E2250;  
   }
  
  //DRAW METHOD
  void draw()
  {    
    //call SETGRADIENT METHOD
    setGradient(0,0, purple, black);      
  }
  
  //SETGRADIENT METHOD
  void setGradient(int x, int y, color c1, color c2)
  {    
    //run till color reaches max height value
    for(int i=y; i<height; i++)
    {
      //get the value of the next mapped height value
      float ratio=map(i,y,height,0,1); 
      //get the blended color
      color blended= lerpColor(c1, c2,ratio);
      //use the blended color for the stroke of the line
      stroke(blended);
      line(x,i, width,i);
    }
  }