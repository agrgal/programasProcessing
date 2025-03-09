void dibujarSector(float x, float y, float anguloInicial, float anguloFinal, float radioInterno, float radioExterno, color c) {
  // Configurar el color del sector
  noFill();
  stroke(c);  // color de borde
  // paso del ángulo y variable ángulo
  float pasoangular = 0.1;
  float angulo = 0.0;  
  for (angulo=anguloInicial ; angulo<=anguloFinal; angulo=angulo+pasoangular) {
    line(x+radioInterno*cos(radians(angulo)),
         y+radioInterno*sin(radians(-angulo)),
         x+radioExterno*cos(radians(angulo)), 
         y+radioExterno*sin(radians(-angulo)));
  } 
}

void setup() {
  size(400, 400);
  background(255);
  
  // Dibujar un sector circular en (200, 200) con ángulo de 0 a 90 grados, radios de 50 a 150, y color rojo
  dibujarSector(200, 200, 0, 30, 50, 150, color(255, 0, 0));
}
