
//z(n+1) = z(n)^2 + c
//save mandelbrot in obscure way

//euro conversion
//how many things are near you on foursquare based on euro miles

/*float mandelbrot(int n, float c){
  if(n==0){
    return 0;
  }
  return pow(mandelbrot(n-1,c),2)+c;
}

color white = color(50,20,30);

void iterateMandel(int level){
  float cXOgSize = 2.1;
  float cXIncrement = cXOgSize/mySize;
  
  float cYOgSize = 1.5;
  float cYIncrement = cYOgSize/mySize;
  
  for(float cY = -cYOgSize; cY<=cYOgSize; cY+=cYIncrement){
    for(float cX = -cXOgSize; cX<=cXOgSize; cX+=cXIncrement){
      float xValue = mandelbrot(level,cX);
      float yValue = mandelbrot(level,cY);
      
       if(abs(xValue) < .01 && abs(yValue) < .01){
        //print(conversion(cX, cXOgSize, mySize));
          set(conversion(cX, cXOgSize, mySize),conversion(cY, cYOgSize, mySize),white);
        //println(conversion(cX, cXOgSize, mySize)+" "+conversion(cY, cYOgSize, mySize));
      }
    }
   
  }
  
  
}

int conversion(float coord, float halfOgSize, int finalSize){
  return (int)round(finalSize*(coord + halfOgSize)/(2.0*halfOgSize));
}

*/

//https://www.mashape.com/imagesearcher/camfind#!documentation
