class Cuadrado {
 
  float x, y, tm;
  color c;
  
  Cuadrado(float x, float y, float tm, color c) {
    this.x = x;
    this.y = y;
    this.tm = tm;
    this.c = c;
  }
  
  void mostrar() {
    pushMatrix();
    translate(x,y);  // en el punto x,y 
    rectMode(CENTER); // centro del dibujo.
    fill(c);
    square(0,0,tm);
    popMatrix();
  }
  
}
