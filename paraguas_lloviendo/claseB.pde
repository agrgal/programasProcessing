/* ========================================
Clase PARAGUAS
=========================================== */
class Paraguas {
  
  float x,y; // posición
  float escala; // escala
  PImage imagen; // imagen
  float velocidad; // velocidad
  
  Paraguas(float x, float y, float escala, float vel, PImage miImagen) { // constructor
    this.x = x;
    this.y = y;
    this.escala = escala;
    this.velocidad = vel;
    this.imagen = miImagen;    
  } // fin del constructor
  
  // A) Método mover
  void mover() {
     x+= velocidad;
     if (x>width) {
        x = -200;
     }
  }
  
  // B) mostrar
  void mostrar() {
    pushMatrix();
    translate(x,y);
    scale(escala);
    image(imagen,0,0);
    popMatrix();
  }
  
  // C) Colisión
  boolean colision(float px, float py) {
  // Ajusta estos valores según el tamaño real de tu imagen de paraguas
  float anchoParaguas = imagen.width * escala;
  float altoParaguas = imagen.height * escala;
  return (px > x && px < x + anchoParaguas && 
          py > y && py < y + altoParaguas); // verdadero si está dentro de esa zona
}

  
} // fin de la clase
