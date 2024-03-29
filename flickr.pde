// Simple sketch to demonstrate uploading directly from a Processing sketch to Flickr.
// Uses a camera as a data source, uploads a frame every time you click the mouse.
/*
import processing.video.*;
import javax.imageio.*;
import java.awt.image.*;
import com.aetrion.flickr.*;

// Fill in your own apiKey and secretKey values.
String apiKey = "e8e25743086edee1eb591038e1d2447e";
String secretKey = "9c347d498e7fcc8f";
                    
Flickr flickr;
Uploader uploader;
Auth auth;
String frob = "";
String token = "";

Capture cam;

void setupFlickr(PImage fractal) {
  background(fractal);
  draw();
  // Set up the camera.
  cam = new Capture(this, myWidth, myHeight);  

  // Set up Flickr.
  flickr = new Flickr(apiKey, secretKey, (new Flickr(apiKey)).getTransport());
  
  // Authentication is the hard part.
  // If you're authenticating for the first time, this will open up
  // a web browser with Flickr's authentication web page and ask you to
  // give the app permission. You'll have 15 seconds to do this before the Processing app
  // gives up waiting fr you.
  
  // After the initial authentication, your info will be saved locally in a text file,
  // so you shouldn't have to go through the authentication song and dance more than once
  authenticate();

  // Create an uploader
  uploader = flickr.getUploader();
  upload();
}

void draw() {
  if (cam.available()) {
    cam.read();
    image(cam, 0, 0);
  }
}

void upload() {
  // Upload the current camera frame.
  println("Uploading");
  
  // First compress it as a jpeg.
  byte[] compressedImage = compressImage(cam);
  
  // Set some meta data.
  UploadMetaData uploadMetaData = new UploadMetaData(); 
  uploadMetaData.setTitle("Frame " + frameCount + " Uploaded from Processing"); 
  uploadMetaData.setDescription("To find out how, go to http://frontiernerds.com/upload-to-flickr-from-processing");   
  uploadMetaData.setPublicFlag(true);

  // Finally, upload/
  try {
    uploader.upload(compressedImage, uploadMetaData);
  }
  catch (Exception e) {
    println("Upload failed");
  }
  
  println("Finished uploading");  
}

// Attempts to authenticate. Note this approach is bad form,
// it uses side effects, etc.
void authenticate() {
  // Do we already have a token?
  if (fileExists("token.txt")) {
    token = loadToken();    
    println("Using saved token " + token);
    authenticateWithToken(token);
  }
  else {
   println("No saved token. Opening browser for authentication");    
   getAuthentication();
  }
}

// FLICKR AUTHENTICATION HELPER FUNCTIONS
// Attempts to authneticate with a given token
void authenticateWithToken(String _token) {
  AuthInterface authInterface = flickr.getAuthInterface();  
  
  // make sure the token is legit
  try {
    authInterface.checkToken(_token);
  }
  catch (Exception e) {
    println("Token is bad, getting a new one");
    getAuthentication();
    return;
  }
  
  auth = new Auth();

  RequestContext requestContext = RequestContext.getRequestContext();
  requestContext.setSharedSecret(secretKey);    
  requestContext.setAuth(auth);
  
  auth.setToken(_token);
  auth.setPermission(Permission.WRITE);
  flickr.setAuth(auth);
  println("Authentication success");
}


// Goes online to get user authentication from Flickr.
void getAuthentication() {
  AuthInterface authInterface = flickr.getAuthInterface();
  
  try {
    frob = authInterface.getFrob();
  } 
  catch (Exception e) {
    e.printStackTrace();
  }

  try {
    URL authURL = authInterface.buildAuthenticationUrl(Permission.WRITE, frob);
    
    // open the authentication URL in a browser
    open(authURL.toExternalForm());    
  }
  catch (Exception e) {
    e.printStackTrace();
  }

  println("You have 15 seconds to approve the app!");  
  int startedWaiting = millis();
  int waitDuration = 15 * 1000; // wait 10 seconds  
  while ((millis() - startedWaiting) < waitDuration) {
    // just wait
  }
  println("Done waiting");

  try {
    auth = authInterface.getToken(frob);
    println("Authentication success");
    // This token can be used until the user revokes it.
    token = auth.getToken();
    // save it for future use
    saveToken(token);
  }
  catch (Exception e) {
    e.printStackTrace();
  }
  
  // complete authentication
  authenticateWithToken(token);
}

// Writes the token to a file so we don't have
// to re-authenticate every time we run the app
void saveToken(String _token) {
  String[] toWrite = { _token };
  saveStrings("token.txt", toWrite);  
}

boolean fileExists(String filename) {
  File file = new File(sketchPath(filename));
  return file.exists();
}

// Load the token string from a file
String loadToken() {
  String[] toRead = loadStrings("token.txt");
  return toRead[0];
}

// IMAGE COMPRESSION HELPER FUNCTION

// Takes a PImage and compresses it into a JPEG byte stream
// Adapted from Dan Shiffman's UDP Sender code
byte[] compressImage(PImage img) {
  // We need a buffered image to do the JPG encoding
  BufferedImage bimg = new BufferedImage( img.width,img.height, BufferedImage.TYPE_INT_RGB );

  img.loadPixels();
  bimg.setRGB(0, 0, img.width, img.height, img.pixels, 0, img.width);

  // Need these output streams to get image as bytes for UDP communication
  ByteArrayOutputStream baStream  = new ByteArrayOutputStream();
  BufferedOutputStream bos    = new BufferedOutputStream(baStream);

  // Turn the BufferedImage into a JPG and put it in the BufferedOutputStream
  // Requires try/catch
  try {
    ImageIO.write(bimg, "jpg", bos);
  } 
  catch (IOException e) {
    e.printStackTrace();
  }

  // Get the byte array, which we will send out via UDP!
  return baStream.toByteArray();
}
*/
