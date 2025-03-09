void setup() {
  size(400, 400);  // Tamaño de la ventana
  noLoop();  // Solo dibujar una vez
}

void draw() {
  background(255);  // Fondo blanco
  
  // Dibujar círculos concéntricos
  for (int i = 200; i > 0; i -= 40) {
    if (i % 80 == 0) {
      fill(255, 0, 0);  // Círculo rojo
    } else {
      fill(255);  // Círculo blanco
    }
    ellipse(width/2, height/2, i*2, i*2);  // Círculos centrados en la pantalla
  }
}
