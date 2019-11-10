class Flower {

  // Variables
  float speedX;//Der blev lavet en speed variable så man kunne flytte på blomsten og sætte den til forskellig hastighed
  float speedY;
  float ballX;
  float ballY;
  
  float scaleX;
  float scaleY;
  float curve;


  float r;       // radius of the flower petal
  int n_petals;  // number of petals 
  float x;       // x-position of the center of the flower
  float y;       // y-position of the center of the flower
  int petalColor;//hexadecimal number for the color of petals
  int boxColor; 
  
  Flower(float temp_r, int temp_n_petals, int temp_x, int temp_y, int temp_petalColor) {  //Constructer for the Mouse Flower 
    r = temp_r;
    n_petals = temp_n_petals;
    x = temp_x;
    y = temp_y;  
    petalColor = temp_petalColor;
  }
  
  Flower(float temp_x, float temp_y, float temp_scaleX, float temp_scaleY, int temp_color, int temp_curve) {
    scaleX = temp_scaleX;
    scaleY = temp_scaleY;
    x = temp_x;
    y = temp_y;
    boxColor = temp_color;
    curve = temp_curve;
  
  }

  Flower(float temp_r, int temp_n_petals, float temp_x, float temp_y, int temp_petalColor, float temp_speedX, float temp_speedY) {
    r=temp_r;
    n_petals = temp_n_petals;
    x=temp_x;
    y=temp_y;
    petalColor=temp_petalColor;
    speedX = temp_speedX;
    speedY = temp_speedY;
  }
  
  void display () {
    fill(petalColor);
    
    for (float i=0; i<PI*2; i+=2*PI/n_petals) {
      //  ballX=width/2 + r*cos(i);
      //  ballY=height/2 + r*sin(i);
      ballX=x + r*cos(i);
      ballY=y + r*sin(i);
      ellipse(ballX, ballY, r, r);
    }
    
    fill(200, 0, 0);
    ellipse(x, y, r*1.2, r*1.2);
  }
  
  void displayMouse () {
    fill(petalColor);
    
    for (float i=0; i<PI*2; i+=2*PI/n_petals) {
      //  ballX=width/2 + r*cos(i);
      //  ballY=height/2 + r*sin(i);
      ballX = mouseX + r*cos(i);
      ballY = mouseY + r*sin(i);
      ellipse(ballX, ballY, r, r);
    }
    
    fill(200, 0, 0);
    ellipse(mouseX, mouseY, r*1.2, r*1.2);
  }
  
  void displayBox () {
    fill(boxColor);
    rectMode(CENTER);
    rect(x, y, scaleX, scaleY, curve);
  }
 
  void move(/*float speed*/) {
    x = x + speedX;
    y = y + speedY;
  }
  
  void bounceX() {
    if (x > width-r || x < r) {
      speedX = speedX * (-1);
      
    }
  }
  
  void bounceY() {
    if  (y > height || y < 0) { 
    speedY *= -1;
    }
  }
  
  void coloring() {
    if (x > width-r || x < r || y > height || y < 0) {
      fill(0,0,255);
      ellipse(x, y, r*1.2, r*1.2);
    }
  }
  
  boolean overlap(Flower other) {
    float d = dist(x, y, other.x, other.y); 
    if (d < r + other.r) {  
      background(255);
      return true;  
    }
    else { 
      return false;
    }
  }
  
  boolean overlapMouse(Flower other) {
    float d = dist(mouseX, mouseY, other.x, other.y); 
    if (d < r + other.r) {  
      background(255,0,0);
      return true;  
    }
    else { 
      return false;
    }
  }
}
