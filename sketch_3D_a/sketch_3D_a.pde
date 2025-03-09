void setup() {
  size(400, 400, P3D);
}

void draw() {
  background(200);
  lights();
  translate(width/2, height/2);
  // rotateX(frameCount * 0.01);
  // rotateY(frameCount * 0.02);
  rotateZ(frameCount*0.01);
  fill(255, 0, 0);
  box(100);
}
