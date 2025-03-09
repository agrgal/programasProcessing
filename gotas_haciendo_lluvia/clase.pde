/* ========================================
Clase GOTA
=========================================== */
class Gota {
  
  float x,y; // posición
  float escala; // escala
  PImage imagen; // imagen
  float velocidad; // velocidad
  
  Gota(float x, float y, float escala, float vel, PImage miImagen) { // constructor
    this.x = x;
    this.y = y;
    this.escala = escala;
    this.velocidad = vel;
    this.imagen = miImagen;    
  } // fin del constructor
  
  // A) Método mover
  void mover() {
     y+= velocidad;
     if (y>height) {
       y=-1*random(75,125);
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
} // fin de la clase
