import processing.core.*; 
import processing.data.*; 
import processing.event.*; 
import processing.opengl.*; 

import java.util.HashMap; 
import java.util.ArrayList; 
import java.io.File; 
import java.io.BufferedReader; 
import java.io.PrintWriter; 
import java.io.InputStream; 
import java.io.OutputStream; 
import java.io.IOException; 

public class Student_FlowerObject_Hector extends PApplet {

Flower[] flowers = new Flower [10];

Flower myFlower1;  // the first instance of the Flower class
Flower myFlower2;  // the second instance of the Flower class
Flower myFlower3;
Flower myFlowerMouse;
Flower myFlowerBox;

int randomBackgroundColor;

public void setup() {
  

  int _r1= 60;
  int _r2 = 100;
  int _r3 = 120;
  int _petals=7;
  float _x=width/2;
  float _y=height/2;
  int _pc=0xffFFA000;
  int offset = 350;
  int col1 = 0xffE873DC;

 
  myFlower1 = new Flower (_r1, _petals, _x, _y, _pc, 2, 3); 
  myFlower2 = new Flower (_r2, _petals, _x+random(-500, 500), _y+offset, _pc, 5, 4);
  myFlower3 = new Flower (_r3, _petals, _x+50, _y-offset, _pc, 7, 5);
  myFlowerMouse = new Flower (_r1, _petals, 0, 0, _pc);
  myFlowerBox = new Flower (random(0,width), random(0,height), 200, 200, col1, 7);
}

public void draw() {
  background(0xff43AF76);
  mousePushed();

  myFlower1.overlap(myFlower2);
  myFlower1.overlap(myFlower3);
  myFlower2.overlap(myFlower3);
  myFlowerMouse.overlapMouse(myFlower1);
  myFlowerMouse.overlapMouse(myFlower2);
  myFlowerMouse.overlapMouse(myFlower3);

  myFlowerBox.displayBox();
  myFlower1.display();
  myFlower2.display();
  myFlower3.display();
  myFlowerMouse.displayMouse();

  
  myFlower1.move();
  myFlower2.move();
  myFlower3.move();
  
  myFlower1.bounceX();
  myFlower2.bounceX();
  myFlower3.bounceX();
   
  myFlower1.bounceY();
  myFlower2.bounceY();
  myFlower3.bounceY();
  
  myFlowerMouse.trail();

}

public void mousePressed()
{
  randomBackgroundColor = color(random(0, 255), random(0, 255), random(0, 255));
}

public void mousePushed() 
{
  if (mousePressed == true)
  {
    background(randomBackgroundColor);
  }
}
int num = 50;
int[] posX = new int [num];
int[] posY = new int [num];

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
  
  public void display () {
    fill(petalColor);
    
    for (float i=0; i<PI*2; i+=2*PI/n_petals) {
      //  ballX=width/2 + r*cos(i);
      //  ballY=height/2 + r*sin(i);
      ballX = x + r*cos(i);
      ballY = y + r*sin(i);
      ellipse(ballX, ballY, r, r);
    }
    
    fill(200, 0, 0);
    ellipse(x, y, r*1.2f, r*1.2f);
  }
  
  public void displayMouse () {
    fill(petalColor);
    
    for (float i=0; i<PI*2; i+=2*PI/n_petals) {
      //  ballX=width/2 + r*cos(i);
      //  ballY=height/2 + r*sin(i);
      ballX = mouseX + r*cos(i);
      ballY = mouseY + r*sin(i);
      ellipse(ballX, ballY, r, r);
    }
    
    fill(200, 0, 0);
    ellipse(mouseX, mouseY, r*1.2f, r*1.2f);
  }
  
  public void displayBox () {
    fill(boxColor);
    rectMode(CENTER);
    rect(x, y, scaleX, scaleY, curve);
  }
 
  public void move(/*float speed*/) {
    x = x + speedX;
    y = y + speedY;
  }
  
  public void bounceX() {
    if (x > width-r || x < r) {
      speedX = speedX * (-1);
      
    }
  }
  
  public void bounceY() {
    if  (y > height || y < 0) { 
    speedY *= -1;
    }
  }
  
  public void coloring() {
    if (x > width-r || x < r || y > height || y < 0) {
      fill(0,0,255);
      ellipse(x, y, r*1.2f, r*1.2f);
    }
  }
  
  public void trail() {
    for (int i = num-1; i > 0; i--) {
      posX[i] = posX[i-1];
      posY[i] = posY[i-1];
    }
    posX[0] = mouseX;
    posY[0] = mouseY;
    
    for (int i = 0; i < num; i++) {
      fill(200, 150, 150, 80);
      ellipse(posX[i], posY[i], 80-i, 80-i);        
    }
  }
  
  public boolean overlap(Flower other) {
    float d = dist(x, y, other.x, other.y); 
    if (d < r + other.r) {  
      background(255);
      return true;  
    }
    else { 
      return false;
    }
  }
  
  public boolean overlapMouse(Flower other) {
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
  public void settings() {  size(1600, 1200); }
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "Student_FlowerObject_Hector" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
