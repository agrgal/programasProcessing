float tamannoHex = 40;
float anchoHex = tamannoHex * 2;
float altoHex = sqrt(3) * tamannoHex;

void setup() {
  size(600, 520);
  noLoop();
}

void draw() {
  background(240);
  rect(0,0,anchoHex,altoHex);
  push();
  translate(anchoHex/2,altoHex/2);
  rotate(PI/2);
  drawHexagon(tamannoHex);
  pop();  
}

void drawHexagon(float size) {
  beginShape();
  for (int i = 0; i < 6; i++) {
    float angle = TWO_PI / 6 * i - PI / 6;
    vertex(cos(angle) * size, sin(angle) * size);
  }
  endShape(CLOSE);
  
  // Añadir un borde para mayor claridad
  stroke(0);
  noFill();
  beginShape();
  for (int i = 0; i < 6; i++) {
    float angle = TWO_PI / 6 * i - PI / 6;
    vertex(cos(angle) * size, sin(angle) * size);
  }
  endShape(CLOSE);
}
