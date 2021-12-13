/*
  
  Main visuals adapted from: 
  https://openprocessing.org/sketch/748916
  
  Slide mouse diagonally towards top right corner for volume control
 
*/
import processing.sound.*;
Sound sounds;
SoundFile[] file;

final int MAX_CIRCLE_CNT = 700, MIN_CIRCLE_CNT = 100;
final int maxVertexCount = 30, minVertexCount = 3;

int circleCnt, vertexCounter;

int numsounds = 4;
  

float[] octave = {0.25, 0.5, 1.0, 2.0, 4.0};
int[] playSound = {1, 1, 1, 1}; 
int trigger; 
int[] posx = {0, 128, 256, 384, 512}; 
PImage mouseCursor;

public void settings() {
 size(900, 900); 
}

void setup() {
  sounds = new Sound(this);
  
  file = new SoundFile[numsounds];

  for (int i = 0; i < numsounds; i++) {
    file[i] = new SoundFile(this, (i+1) + ".wav");
  }
   
  trigger = millis(); 
  
  mouseCursor = loadImage("greencircle.png");
}

void draw() {
  background(0);
  cursor(mouseCursor, 0, 0);
  translate(width / 2, height / 2);
  
  float amplitude = map(mouseY, mouseX/2, height, 0.4, 0.0);
  
  soundSampler();
  mousecount();
  sounds.volume(amplitude);
  for (int ci = 0; ci < circleCnt; ci++) {
    float time = float(frameCount) / 20;
    float thetaC = map(ci, 0, circleCnt, 0, TAU);
    float scale = 300;

    PVector circleCenter = getCenterByTheta(thetaC, time, scale);
    float circleSize = getSizeByTheta(thetaC, time, scale);
    color c = getColorByTheta(thetaC, time);

    stroke(c);
    noFill();
    beginShape();
    for (int vi = 0; vi < vertexCounter; vi++) {
      float thetaV = map(vi, 0, vertexCounter, 0, TAU);
      float x = circleCenter.x + cos(thetaV) * circleSize;
      float y = circleCenter.y + sin(thetaV) * circleSize;
      vertex(x, y);
    }
    endShape(CLOSE);
  }
}

  
