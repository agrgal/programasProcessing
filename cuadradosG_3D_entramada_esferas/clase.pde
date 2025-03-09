class Cubo {
 
  float x, y, z, tm; //tengo que definir la z
  color c;
  
  Cubo(float x, float y, float z, float tm, color c) {
    this.x = x; // cuidado, coordenadas relativas
    this.y = y; // cuidado, coordenadas relativas
    this.z = z; // tengo que añadir el parámetro z
    this.tm = tm;
    this.c = c;
  }
  
  void mostrar() {
    pushMatrix();
    translate(x,y,z); // me muevo en las tres coordenadas
    // rectMode(CENTER); // centro del dibujo.
    noFill();
    stroke(c);
    strokeWeight(8);
    // square(0,0,tm); // en el punto x,y 
    box(tm); // ahora es un cubo, no un cuadrado.
    popMatrix();
  }
  
  void esfera() {
    pushMatrix();
    translate(x,y,z); // me muevo en las tres coordenadas
    // rectMode(CENTER); // centro del dibujo.
    noStroke();
    fill(255,0,0);
    // square(0,0,tm); // en el punto x,y 
    sphere(tm/8); // ahora es un cubo, no un cuadrado.
    popMatrix();
  }
  
}
