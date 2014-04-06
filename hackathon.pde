import java.io.*;
import java.awt.Desktop;
import java.net.URI;


int mySize =500;
String mainPath = "sum/";
//initialize

String text;
String urlPath = "http://localhost/hackathon/";

void setup(){
  deleteSumDirectory();
  size(640, 360);
  noLoop();
  background(255);
  print("Type your text (Enter when done): ");
  
}

void drawText(String text){
  background(0);
  textSize(100);
  fill(50);
  text(text, 100, 100);
  draw();
}

//start only if you press "1"
void keyPressed() {
  if (key == '\n' ) {
    println();
    print("processing...");
   
    
    makeLetterFolder(text);
    getAllImageDirectory("sum/");
    
  
    // A String can be cleared by setting it equal to ""
    text = ""; 
    accessAggregate();
  } 
  else {
    // Otherwise, concatenate the String
    // Each character typed by the user is added to the end of the String variable.
    text = text + key; 
    print(key);
    
  }
  //next step here
  
  
  
}

//makes folders for all letters
//index starts at A
void makeLetterFolder(String hw){
  char index = 'A';
  for(int i =4; i<hw.length(); i++){
       char c = hw.charAt(i);
       String folderName = ("letter_"+index++)+"_"+c;
       iterateMandel(folderName, c);
  }
}

//makes all images equaling ascii of letter
void iterateMandel(String folderName, int ascii){
  for(int i = 0; i<ascii; i++){
    aMandel(folderName,"image",i);
  }
}


//resets everything. Needs work
void deleteSumDirectory(){
  File dir = new File(mainPath);
   if (dir.exists())
   {  print("hi");
         dir.delete();
   }
}


void accessAggregate(){
  try{
    URL data = new URL("http://localhost/hackathon/aggregate.php");
     BufferedReader in = new BufferedReader(
      new InputStreamReader(data.openStream()));
    
      String inputLine;
      String finalLine ="";
      while ((inputLine = in.readLine()) != null){
        //System.out.println(inputLine);
        String marker = "Data: ";
          int index = inputLine.indexOf(marker);
          //if(index!=-1){
            finalLine = inputLine;//inputLine.substring(index+marker.length());
            print(finalLine);
            break;
         // }
      }
          
      in.close();
      int array[] = makeArray(finalLine);
      output(intToString(array));
  }
  catch (Exception E){
    print("my exception");
  }
  
  
 
}

public int[] makeArray(String input){
  String[] strArray = input.split(",");
  int[] intArray = new int[strArray.length];
  for(int i = 0; i < strArray.length; i++) {
      intArray[i] = Integer.parseInt(strArray[i]);
  }
  
  return intArray;
}
public static void openWebpage(URI uri) {
    Desktop desktop = Desktop.isDesktopSupported() ? Desktop.getDesktop() : null;
    if (desktop != null && desktop.isSupported(Desktop.Action.BROWSE)) {
        try {
            desktop.browse(uri);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}

public static void openWebpage(URL url) {
    try {
        openWebpage(url.toURI());
    } catch (URISyntaxException e) {
        e.printStackTrace();
    }
}


public void output(String text){
    
  try{
  URL url = new URL(urlPath+"text.php?text="+text);
  openWebpage(url);
  }
  catch (Exception E){
    print("exception");
  }
  
  println();
  print(text);
}


public String intToString(int[] array){
  String text = "";
  for(int i: array){
    text+= (char)i;
  }
  return text;
}
