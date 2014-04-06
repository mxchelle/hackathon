import java.util.ArrayList;
import java.util.*;
import java.net.*;

void getAllImageDirectory(String path){
  println("Fractals Complete");

  try{
    String urlStr = "http://localhost/hackathon/clear.php";
    URL url = new URL(urlStr);
    openWebpage(url);
  }
  catch (Exception E){
    print("exception");
  }
  
  File folder = new File(sketchPath("")+mainPath);
  File[] listOfFiles = folder.listFiles();
  int count = 0;
    for (int i = 0; i < listOfFiles.length; i++) {
      if (listOfFiles[i].isDirectory()) {
        
        String pre = "letter_";
        String absPath = listOfFiles[i].getAbsolutePath();
        int pos = absPath.indexOf("letter_")+pre.length();
        char index = absPath.charAt(pos);
        print((char)index);
        eachDirectory(listOfFiles[i], index);
        println(listOfFiles[i].getAbsolutePath());
    }
    
   }
}

void eachDirectory(File folder, char index){
  
   ArrayList<String> allImgData = new ArrayList<String>();
  
   File[] imageList = folder.listFiles();
   for(int j = 0; j < imageList.length; j++){
    if (imageList[j].isFile() && imageList[j].getAbsolutePath().endsWith(".jpg")) {
        String path = imageList[j].getAbsolutePath();
        PImage img = loadImage(path);
        allImgData.add(imageData(img));
    }
  }
  
  for(String data: allImgData){
    post(index, data);
  }
}

//takes in imagePath, get number to represent imageColor data
// irony is that I used StringBuffer and compress to save time and space
public String imageData(PImage img){
  StringBuffer str = new StringBuffer();
  for(int i =0; i<img.width; i++){
     for(int j =0; j<img.height; j++){
       int r = (int)(100*red(img.get(i, j)));
       str.append(compress(r)+" , ");
    }
  }
  return str.toString();
}

//compress to save space
int colorSaved = 5;
public int compress(int colorValue){
  int increment = 100/colorSaved;
  return (colorValue/increment)*increment;
}

//posting to PHP


public void post(char index, String blob){
 
 
  //blob = "change";
  
  
  String url = "http://localhost/hackathon/";
  Map<String, String> data = new HashMap<String, String>();
  data.put("index", ""+((int)index));
  //data.put("letter", ""+index);
  data.put("blob", blob);

  try{
    doSubmit(url, data);
  }
  catch(Exception e){
    print("oh nome");
  }
}

public void doSubmit(String url, Map<String, String> data) throws Exception {
    URL siteUrl = new URL(url);
    HttpURLConnection conn = (HttpURLConnection) siteUrl.openConnection();
    conn.setRequestMethod("POST");
    conn.setDoOutput(true);
    conn.setDoInput(true);
    
    DataOutputStream out = new DataOutputStream(conn.getOutputStream());
    
    Set keys = data.keySet();
    Iterator keyIter = keys.iterator();
    String content = "";
    for(int i=0; keyIter.hasNext(); i++) {
      Object key = keyIter.next();
      if(i!=0) {
        content += "&";
      }
      content += key + "=" + URLEncoder.encode(data.get(key), "UTF-8");
    }
   // System.out.println(content);
    out.writeBytes(content);
    out.flush();
    out.close();
    BufferedReader in = new BufferedReader(new InputStreamReader(conn.getInputStream()));
    String line = "";
    while((line=in.readLine())!=null) {
      //System.out.println(line);
    }
    in.close();
}

