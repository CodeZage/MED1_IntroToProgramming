Object[] Objects = new Object[2];

void setup() 
{
    size(1920, 1080);
    frameRate(60);
    smooth(8);  

    for (int i = 0; i < Objects.length; i++)  
    {
        Objects[i] = new Object(random(0, width), random(0, height));
    }
}

void draw() 
{   
    background(#00ffbb);

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
