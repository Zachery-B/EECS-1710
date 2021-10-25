float spread = 1;

void setup() {
  size (600, 400, P2D);
}

void draw() {
  background(155, 155, 155);
  fill (0, 0, 100);
  
  float x = width / 2+ random(-spread, spread);
  float y = height / 2+ random(-spread, spread);
  
  rect(x, y, mouseX, mouseY);
 
  if (spread == 1) {
    spread ++;
}
  else if (spread == 100) {
    spread --;
}
}
