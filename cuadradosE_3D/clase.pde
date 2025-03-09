class Cubo {
 
  float x, y, z, tm; //tengo que definir la z
  color c;
  
  Cubo(float x, float y, float z, float tm, color c) {
    this.x = x;
    this.y = y;
    this.z = z; // tengo que añadir el parámetro z
    this.tm = tm;
    this.c = c;
  }
  
  void mostrar() {
    pushMatrix();
    translate(x,y,z); // me muevo en las tres coordenadas
    // rectMode(CENTER); // centro del dibujo.
    fill(c);
    // square(0,0,tm); // en el punto x,y 
    box(tm); // ahora es un cubo, no un cuadrado.
    popMatrix();
  }
  
}
