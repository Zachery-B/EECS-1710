class Dog {

  
  float bowlX = 725;
  float bowlY = 500;
  
  boolean debug = true;
  PVector position, target;
  PImage dogCurrent, dog_idle, dog_hungry, dog_happy, bowl;
  float margin = 50;
  
  boolean isPet = false;
  int petTime = 0;
  int petTimeout = 1000;
  float petSpread = 5;
  
  boolean idleAnim = false;
  
  float triggerDistance1 = 45;
  float triggerDistance2 = 25;
  float movementSpeed = 0.08;
  
  float triggerDistance3 = 50;
  
  Dog(float x, float y) {
    position = new PVector (x, y);
    pickTarget(); 
    
    dog_idle = loadImage("dog_idle.png");
    dog_hungry = loadImage("dog_hungry.png");
    dog_happy = loadImage("dog_happy.png");

    dog_idle.resize(100, 75);
    dog_hungry.resize(100, 75);
    dog_happy.resize(75, 85);

    dogCurrent = dog_idle;

    bowl = loadImage("bowl.png");
    
    bowl.resize(75, 75);
    
  }
  
  void update() {
   PVector mousePos = new PVector(mouseX, mouseY); 
     isPet = position.dist(mousePos) < triggerDistance1;
     
     if (isPet) {
       petTime = millis();
       dogCurrent = dog_happy;
       println(millis());
     } else if (!isPet && millis() > 1000) {
          dogCurrent = dog_idle; 
         }
      
  }
  
  void mouseClicked() {
    if (mousePressed && (mouseButton == RIGHT)) {
    target = new PVector(mouseX, mouseY);
    position = position.lerp(target, movementSpeed);
    }/*else if (key == 'r') {
     target = new PVector(width/2, height/2); 
    } */
  }
  
  void eat() {
   if (position.dist(food.position) < 10) {
     food.alive = false;
   }
  }
  
  void draw() {
    ellipseMode(CENTER);
    rectMode(CENTER);
    imageMode(CENTER);
   
   image(dogCurrent, position.x, position.y);
   image(bowl, bowlX, bowlY);
   
   
   if (debug) {
     noFill();
     stroke(255, 0, 0);
     ellipse(position.x, position.y, triggerDistance1*2, triggerDistance1*2);
     ellipse(position.x, position.y, triggerDistance2*2, triggerDistance2*2);
     ellipse(bowlX, bowlY, triggerDistance3*2, triggerDistance3*2);
     line(target.x, target.y, position.x, position.y);
     stroke(255, 0, 0);
     rect(target.x, target.y, 10, 10);
    
  }
  }
  void run() {
    update();
    eat();
    mouseClicked();
    draw();
  }

  
 
  void pickTarget() {
   target = new PVector(random(margin, width-margin), random(height-margin));
 }
  }
  
