PImage highway;
PImage car;
PImage hotairballoon;
float x;
float y;
float speedX = 5;

void setup() {
  size(612, 734, P2D);
  highway = loadImage("highway.jpg");
  car = loadImage("370z.png"); 
  hotairballoon = loadImage("hotairballoon.png");
  highway.resize(1224, 734);
  car.resize(365,125);
  hotairballoon.resize(200,375);
  x = width/2;
  y = height/2;
  imageMode(CENTER);
}

void draw() {
  println(highway.width + " " + highway.height);
  image(highway, x, y, highway.width * (height / highway.height), height);
  image(car, mouseX, 620);
  image(hotairballoon, x - 350, y - 300);
  x += speedX;
   if (x > width || x < 0) {
   speedX *= -1;
   
  }
}
