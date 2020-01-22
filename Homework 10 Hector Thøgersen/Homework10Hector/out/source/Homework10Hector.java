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

public class Homework10Hector extends PApplet {

Object[] Objects = new Object[2];

public void setup() 
{
    
    frameRate(60);
      

    for (int i = 0; i < Objects.length; i++)  
    {
        Objects[i] = new Object(random(0, width), random(0, height));
    }
}

public void draw() 
{   
    background(0xff00ffbb);

    Objects[0].trail1();
    Objects[1].trail2();

    for (int i = 0; i < Objects.length; i++)
    {   
        fill(255, 255, 255, 255);
        Objects[i].drawObject();
        Objects[i].move();
        Objects[i].bounce();
    }


}
class Object
{
    PVector position; 
    PVector velocity;
    
    int tailLength = 50;

    float[] tail1X = new float[tailLength];
    float[] tail1Y = new float[tailLength];

    int indexPosition = 0;
    float[] tail2X = new float[tailLength];
    float[] tail2Y = new float[tailLength];

    int col;

    Object(float x, float y)
    {
        position = new PVector(0, 0);
        velocity = new PVector(random(-2, 2), random(-2, 2));
        position.x = x;
        position.y = y;            
    }

    public void drawObject()
    {
        ellipse(position.x, position.y, 60, 60);
    }

    public void move()
    {   
        velocity.setMag(10);
        position.add(velocity);
    }

    public void bounce()
    {
        if(position.x > width || position.x < 0)
        {
            velocity.x *= -1;
        }
        if(position.y > height || position.y < 0)
        {
            velocity.y *= -1;
        }

    }

    public void trail1()
    {   
        tail1X[0] = position.x;
        tail1Y[0] = position.y;

        for (int i = tailLength - 1; i > 0; i--)
        {
            tail1X[i] = tail1X[i - 1];
            tail1Y[i] = tail1Y[i - 1];
        }

        for (int i = 0; i < tailLength; i++)
        {   
            fill(255, 255, 255, 100 - i);
            ellipse(tail1X[i], tail1Y[i], 60 - i, 60 - i);
        }
    }

    public void trail2()
    {
        tail2X[indexPosition] = position.x;
        tail2Y[indexPosition] = position.y;

        indexPosition = (indexPosition + 1) % tailLength;

        for (int i = 0; i < tailLength; i++)
        {
            int pos = (indexPosition + i) % tailLength;
            float radius = (tailLength - i);
            ellipse(tail2X[pos], tail2Y[pos], 60 - radius, 60 - radius);
        }
    }   
}
  public void settings() {  size(1920, 1080);  smooth(8); }
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "Homework10Hector" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
