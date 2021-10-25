class Player {
  
  PVector startPosition, position, target;
  float movementStep = 50;
  float movementSpeed = 0.1;
  color col = color(127, 255, 10);
  boolean alive;
  
  Player() {
    init();
  }
  
  void init() {
    alive = true;
    startPosition = new PVector(width/2, height - 50);
    position = startPosition.copy();
    target = position.copy();
  }
  
  void moveForward() {
    target.y -= movementStep;
  }
  
  void update() {
    position.lerp(target, movementSpeed);
  }
  
  void draw() {
  rectMode(CENTER);
  if (alive) {
    fill(col);
  } else {
    fill(255, 0, 0);
    position = startPosition.copy();
    alive = false;
    text("Press r to restart", width/2 - 180, height/2);
  }
  rect(position.x, position.y, 50, 100);  
  
  if (alive && player.position.y < 50) {
    level+=1;
    position = startPosition.copy();
    player.init();
  }
  
  
  if (debug) {
    noFill();
    stroke(debugColor);
    ellipse(player.position.x, player.position.y, crashRange, crashRange);
    println(player.position.y);
  }
}

  void run() {
    update();
    draw();
  }
 
}
  
  
  
