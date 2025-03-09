class Gota {
  float x, y;
  float velocidad;
  float escala;
  
  Gota() {
    reiniciar();
  }
  
  void reiniciar() {
    x = random(width);
    y = random(-200, -100);
    velocidad = random(4, 10);
    escala = map(velocidad, 4, 10, 0.1, 0.5);
  }
  
  void caer() {
    y += velocidad;
    if (y > height) {
      reiniciar();
    }
  }
  
  void mostrar() {
    pushMatrix();
    translate(x, y);
    scale(escala);
    image(spriteLluvia, 0, 0);
    popMatrix();
  }
}
