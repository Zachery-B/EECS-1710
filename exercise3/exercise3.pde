float rot1 = 0;
float rot2 = 0;
float lengthHand1 = 150;
float lengthHand2 = 75;
int lastSecond = 0;
int lastMinute = 0;

void setup() {
  size(800, 600, P2D);
}

void draw() {
  ellipse(width/2, height/2, 500, 500);
  
  pushMatrix();
  translate(width/2, height/2);
  rotate(radians(rot1));
  line(0, 0, lengthHand1, 0);
  ellipse(lengthHand1, 0, 10, 10);
  popMatrix();

  pushMatrix();
  translate(width/2, height/2);
  rotate(radians(rot2));
  line(0, 0, lengthHand2, 0);
  ellipse(lengthHand2, 0, 10, 10);
  popMatrix();

  int s = second();
  int m = minute();
  
  if (second() != lastSecond) {
   rot1 += 6;
   lastSecond = s;
  }

  if (m != lastMinute) {
   rot2 += 6;
   lastMinute = m;
  }
  

  println(second() + " " + minute());
}
