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

    color col;

    Object(float x, float y)
    {
        position = new PVector(0, 0);
        velocity = new PVector(random(-2, 2), random(-2, 2));
        position.x = x;
        position.y = y;            
    }

    void drawObject()
    {
        ellipse(position.x, position.y, 60, 60);
    }

    void move()
    {   
        velocity.setMag(10);
        position.add(velocity);
    }

    void bounce()
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

    void trail1()
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

    void trail2()
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
