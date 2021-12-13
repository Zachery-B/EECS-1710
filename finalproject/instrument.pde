void mousecount() {
  float xoffset = abs(mouseX - width / 2), yoffset = abs(mouseY - height / 2);
  circleCnt = int(map(xoffset, 0, width / 2, MAX_CIRCLE_CNT, MIN_CIRCLE_CNT));
  vertexCounter = int(map(yoffset, 0, height / 2, maxVertexCount, minVertexCount));
}

  PVector getCenterByTheta(float theta, float time, float scale) {
  PVector direction = new PVector(cos(theta), sin(theta));
  float distance = 0.6 + 0.7 * cos(theta * 6.2 + cos(theta * 8.0 + time));
  PVector circleCenter = PVector.mult(direction, distance * scale);
  return circleCenter;
}

  float getSizeByTheta(float theta, float time, float scale) {
  float offset = 0.2 + 0.14 * cos(theta * 9.0 - time * 2.0);
  float circleSize = scale * offset;
  return circleSize;
}

  color getColorByTheta(float theta, float time) {
  float th = 7.0 * theta + time * 3.0;
  float r = 0.9 + 0.5 * cos(th), 
  g = 0.3 + 0.9 * cos(th - PI / 3), 
  b = 0.8 + 0.8 * cos(th - PI * 2.0 / 3.0), 
  alpha = map(circleCnt, MIN_CIRCLE_CNT, MAX_CIRCLE_CNT, 150, 30);
  return color(r * 255, g * 255, b * 255, alpha);
}
