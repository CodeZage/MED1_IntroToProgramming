 float x;       // x-position of the center of the flower
 float xSpeed = random(1,10);
 float ySpeed = random(1,10);
 float y;       // y-position of the center of the flower
  
class Flower {
  
 // Variables
 
 float r;       // radius of the flower petal
 int nPetals;  // number of petals 
 int petalColor;//hexadecimal number for the color of petals



Flower(float temp_r, int temp_n_petals, float temp_x, float temp_y, int temp_petalColor, float x_speed, float y_speed) {
  r = temp_r;
  nPetals = temp_n_petals;
  x = temp_x;
  y = temp_y;
  petalColor = temp_petalColor;
  xSpeed = x_speed;
  ySpeed = y_speed;
}


//Draws the flower
void display () {
  
  float ballX;
  float ballY;
  
  fill(petalColor);
  
  for (float i = 0; i < PI * 2; i += 2 * PI / nPetals) {
  ballX = x + r * cos(i);
  ballY = y + r * sin(i);
  ellipse(ballX, ballY, r, r); 
  }
  
  fill(200, 0, 0);
  ellipse(x, y, r * 1.2, r * 1.2);
}

void move() {
  x += xSpeed;
  y += ySpeed;
}

void bounceX() {
  xSpeed = xSpeed*-1;
}
void bounceY() {
  ySpeed *= -1;

}
}
