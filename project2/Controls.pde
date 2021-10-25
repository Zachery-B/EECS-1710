void keyPressed() {
  if (key == ' ') {
    player.moveForward();
  } else if (key == 'd') { //debug
    debug =!debug;
  } else if (key == 'r') { //resets game
    player.init();
    level = 1;
    
  }
}
