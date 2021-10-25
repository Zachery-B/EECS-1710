class Food { 
  
  PVector position;
  float sizeVal;
  boolean alive = true;
  
  PImage bowl;
  
  Food(float x, float y) {
    position = new PVector(x, y);
    sizeVal = random(10, 15);
    
  bowl = loadImage("bowl.png");
  bowl.resize(75, 75);
  }
  
  void draw() {
    if(!alive) {
      position.x = random(width);
      position.y = random(height);
      alive = true; 
    }
    ellipseMode(CENTER);
    noStroke();
    fill(0);
    image(bowl, position.x, position.y);
  }
  
  void run() {
    draw();
  }
}
