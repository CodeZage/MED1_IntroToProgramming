Flower myFlower1;  // the first instance of the Flower class
Flower myFlower2;
Flower myFlower3;

void setup() {

  size(1600, 1200);

  int _r1 = 60;
  int _petals = 7;
  int _pc = #FFA000;

  myFlower1 = new Flower(_r1, _petals, _x1, _y1+10, _pc, xSpeed, ySpeed);
  myFlower2 = new Flower(_r1, _petals, _x2+random(-100, 100), _y2, _pc, xSpeed, ySpeed);
  myFlower3 = new Flower(_r1, _petals, _x3+50, _y3, _pc, xSpeed, ySpeed);
}

void draw() {

  background(#43AF76);

  myFlower1.display();
  myFlower2.display();
  myFlower3.display();

  myFlower1.move();
  myFlower2.move();
  myFlower3.move();

  if (x >= width) {
    myFlower1.bounceX();
    myFlower2.bounceX();
    myFlower3.bounceX();
  }
  if (x <= 0) {
    myFlower1.bounceX();
    myFlower2.bounceX();
    myFlower3.bounceX();
  }
  if (y >= height) {
    myFlower1.bounceY();
    myFlower2.bounceY();
    myFlower3.bounceY();
  }
  if (y <= 0) {
    myFlower1.bounceY();
    myFlower2.bounceY();
    myFlower3.bounceY();
  }
}
