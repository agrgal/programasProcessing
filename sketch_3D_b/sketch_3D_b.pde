void setup() {
  size(600, 400, P3D);
}

void draw() {
  background(200);
  translate(width/2, height/2, 0);
  rotateX(frameCount * 0.01);
  rotateY(frameCount * 0.01);
  
  fill(255, 150, 0);
  stroke(0);
  
  beginShape(TRIANGLES);
  
  // Base
  vertex(-100, 100, -100);
  vertex( 100, 100, -100);
  vertex( 100, 100,  100);
  vertex( 100, 100,  100);
  vertex(-100, 100,  100);
  vertex(-100, 100, -100);
  
  // Caras laterales
  vertex(   0,   -100,    0);
  vertex(-100,  100, -100);
  vertex( 100,  100, -100);
  
  vertex(   0,   -100,    0);
  vertex( 100,  100, -100);
  vertex( 100,  100,  100);
  
  vertex(   0,   -100,    0);
  vertex( 100,  100,  100);
  vertex(-100,  100,  100);
  
  vertex(   0,   -100,    0);
  vertex(-100,  100,  100);
  vertex(-100,  100, -100);
  
  endShape();
}
