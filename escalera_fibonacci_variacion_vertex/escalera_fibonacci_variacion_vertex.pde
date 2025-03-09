float phi = (1+sqrt(5))/2;
float ancho = 13;
float alto = 8;
float angulo = 0;
int numRectangulos = 20;

void setup() {
  size(800, 800);
  background(255);
  noLoop();
}

void draw() {
  translate(width/2, height/2);
  
  float[][] rectangulos = new float[numRectangulos][3]; // [ancho, alto, angulo]
  
  // Calcular dimensiones y ángulos
  for (int i = 0; i < numRectangulos; i++) {
    rectangulos[i][0] = ancho;
    rectangulos[i][1] = alto;
    rectangulos[i][2] = angulo;
    
    float diagonal = sqrt(pow(ancho,2) + pow(alto,2));
    ancho = diagonal;
    alto = ancho/phi;
    angulo -= atan2(alto, ancho);
  }
  
  // Dibujar rectángulos usando vertex()
  for (int i = numRectangulos - 1; i >= 0; i--) {
    pushMatrix();
    rotate(rectangulos[i][2]);
    
    fill(random(255), random(255), random(255), 255);
    stroke(0, 150);
    
    beginShape();
    vertex(0, 0);
    vertex(rectangulos[i][0], 0);
    vertex(rectangulos[i][0], -rectangulos[i][1]);
    // vertex(0, -rectangulos[i][1]);
    endShape(CLOSE);
    
    popMatrix();
  }
}
