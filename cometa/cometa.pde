float centerX, centerY = 0.0;

void setup() {
  size(600, 600);
  background(135, 206, 250);  // Cielo azul claro
  noLoop();
}

void draw() {
  centerX = random(200,400);
  centerY = random(200,400); 
  // Dibujar el hilo de la cometa
  dibujarHilo(centerX, centerY, 300+random(-100,100), 350+random(-100,100));
  // Dibujar la cometa
  dibujarCometa(centerX, centerY, 100);
}

// Función para dibujar el cuerpo de la cometa (rombo hecho de dos triángulos)
void dibujarCometa(float x, float y, float tamano) {
  fill(255, 0, 0);  // Color rojo para la cometa
  noStroke();
  
  // Triángulo superior
  triangle(x, y - tamano / 2, x - tamano / 2, y, x + tamano / 2, y);
  
  // Triángulo inferior
  triangle(x, y + tamano / 2, x - tamano / 2, y, x + tamano / 2, y);
  
  // Opcional: agregar detalles como la cruz central
  stroke(0);
  line(x, y - tamano / 2, x, y + tamano / 2);  // Línea vertical
  line(x - tamano / 2, y, x + tamano / 2, y);  // Línea horizontal
}

// Función para dibujar el hilo de la cometa (varias líneas o pequeños rectángulos)
void dibujarHilo(float x1, float y1, float x2, float y2) {
  stroke(0);  // Color negro para el hilo
  strokeWeight(2);
  
  // Dibujar el hilo como una línea
  line(x1, y1, x2, y2);
  
  // Opcional: agregar pequeños lazos al hilo
  for (int i = 0; i < 10; i++) {
    float posX = lerp(x1, x2, i / 10.0);  // Posición en el hilo
    float posY = lerp(y1, y2, i / 10.0);  // Posición en el hilo
    fill(0);
    rect(posX - 3, posY - 3, 6, 6);  // Pequeños rectángulos en el hilo
  }
}
