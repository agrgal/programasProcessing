void setup() {
  size(400, 400);  // Tamaño de la ventana
  background(255);  // Fondo blanco
  noLoop();  // Solo dibujar una vez
}

void draw() {
  // Dibujar la base de la casa (un rectángulo)
  fill(200, 100, 50);  // Color marrón claro
  rect(100, 200, 200, 150);
  
  // Dibujar el techo (un triángulo)
  fill(150, 50, 30);  // Color marrón oscuro
  triangle(100, 200, 300, 200, 200, 100);
  
  // Dibujar una puerta (un rectángulo)
  fill(100, 50, 20);  // Color marrón oscuro
  rect(180, 270, 40, 80);
  
  // Dibujar dos ventanas (rectángulos)
  fill(150, 200, 255);  // Color azul claro
  rect(130, 230, 40, 40);  // Ventana izquierda
  rect(230, 230, 40, 40);  // Ventana derecha
  
  // Dibujar el sol (un círculo)
  fill(255, 204, 0);  // Color amarillo
  ellipse(50, 50, 80, 80);  // Sol en la esquina superior izquierda
  
  // Dibujar líneas que representan la hierba
  stroke(0, 150, 0);  // Color verde
  for (int i = 0; i < width; i += 10) {
    line(i, 350, i + 5, 370);  // Líneas diagonales para la hierba
  }
}
