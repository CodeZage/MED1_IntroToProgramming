Flower myFlower1;  // the first instance of the Flower class
Flower myFlower2;
Flower myFlower3;

void setup() {

  size(1600, 1200);

  int _r1 = 60;
  int _petals = 7;
  int _pc = #FFA000;


  myFlower1 = new Flower(_r1, _petals, random(0,width), random(0,height), _pc, random(1, 10), random(1, 10));
  myFlower2 = new Flower(_r1, _petals, random(0,width), random(0,height), _pc, random(1, 10), random(1, 10));
  myFlower3 = new Flower(_r1, _petals, random(0,width), random(0,height), _pc, random(1, 10), random(1, 10));
} 

void draw() {

  background(#43AF76);

  myFlower1.displayFlower();
  myFlower2.displayFlower();
  myFlower3.displayFlower();

  myFlower1.move();
  myFlower2.move();
  myFlower3.move();

  myFlower1.bounceX();
  myFlower2.bounceX();
  myFlower3.bounceX();

  myFlower1.bounceY();
  myFlower2.bounceY();
  myFlower3.bounceY();
  
  myFlower1.overlap(myFlower3);

}
