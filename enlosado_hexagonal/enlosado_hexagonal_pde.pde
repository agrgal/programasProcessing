float tamannoHex = 40;
float anchoHex = tamannoHex * 2;
float altoHex = sqrt(3) * tamannoHex;
int fila = 0;
int columna = 0;
int i = 0;

void setup() {
  size(800, 600);
  noLoop();
}

void draw() {
  background(240);
  // rect(0,0,anchoHex,altoHex);
  for (i = 0; i<100; i++) {
    columna = int(i % (width / anchoHex));
    fila = int (i / (width / anchoHex));
    pushMatrix();
      translate(columna*anchoHex+anchoHex/2,fila*altoHex+altoHex/2);
      rotate(PI/2);
      drawHexagon(tamannoHex);
    popMatrix();  
    
  }

}


/* FUNCION QUE DIBUJA EL HEXAGONO */
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
