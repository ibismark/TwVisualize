import processing.opengl.*;  
  
PFont font;  
long  time;

float degree;
int r;            // radius
float centerx;    // center point (x, y, z)
float centery;
float centerz;

float rad;        // sita 

float x;
float y;
float z;

PVector pos;
float offsetx;
float offsety;

  
void setup() {  
  size(displayWidth, displayHeight, OPENGL);
  frameRate(20);
    
  // font  
  font = createFont("Meiryo", 48);

  degree = 0.0;
  r = 600;
  //centerx = displayWidth/2.0;
  //centery = displayHeight/2.0;
  //centerx = 0.0;
  //centery = 0.0; 
    
}  
  
void draw() {
  background(50);
  camera(0, -300, mouseX, 0, 0, 0, 0, 1, 0);
  
  pushStyle();
  
      rad = PI/180.0*degree;
      offsetx = random(-2, 2);
      offsety = random(-2, 2);
      //rad = random(0, 2.0*PI);
      x = centerx + r*cos(rad);
      y = centery;
      z = centerz + r*sin(rad);
      pos = new PVector(x, y, z);
      
      pushMatrix();
          //pos.set(x+offsetx, 0, z+offsety);
          translate(pos.x, pos.y, pos.z);
          text("test", 0, 0);
      popMatrix();
   
      
      stroke(0, 255, 0);
      for(int x = -1000; x <= 1000; x += 100)
          line(x, 0, -1000, x, 0, 1000);
      for(int z = -1000; z <= 1000; z += 100)
          line(-1000, 0, z, 1000, 0, z);
          
          
      stroke(255, 0, 0);
      line(0, -500, 0, 0, 500, 0);
      
  popStyle();
  
  
  degree+= 1;
  
  
  
}
