Flower myFlower1;  // the first instance of the Flower class
Flower myFlower2;  // the second instance of the Flower class
Flower myFlower3;
Flower myFlowerMouse;
Flower myFlowerBox;

void setup() {
  size(1600, 1200);

  int _r1= 60;
  int _r2 = 100;
  int _r3 = 120;
  int _petals=7;
  float _x=width/2;
  float _y=height/2;
  int _pc=#FFA000;
  int offset = 350;
  int col1 = #E873DC;


  myFlower1 = new Flower (_r1, _petals, _x, _y, _pc, 2, 3); 
  myFlower2 = new Flower (_r2, _petals, _x+random(-500, 500), _y+offset, _pc, 5, 4);
  myFlower3 = new Flower (_r3, _petals, _x+50, _y-offset, _pc, 7, 5);
  myFlowerMouse = new Flower (_r1, _petals, 0, 0, _pc);
  myFlowerBox = new Flower (random(0,width), random(0,height), 200, 200, col1, 7);
}

void draw() {
  background(#43AF76);

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

}
