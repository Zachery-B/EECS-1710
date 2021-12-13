void soundSampler() {
    
    if (millis() > trigger) {
      background(0);

      for (int i = 0; i < numsounds; i++) {      
        if (playSound[i] == 1) {
          float rate;
          fill(0);
          noStroke();
          rect(mouseX, 50, 128, 260);
          rate = octave[int(random(0, 2))];
          file[i].play(rate, 1.0);
      }
      playSound[i] = int(random(0, 4));
    }
    trigger = millis() + int(random(600, 1200));
  }
} 
