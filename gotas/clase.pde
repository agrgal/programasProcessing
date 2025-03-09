/* ========================================
Clase GOTA
=========================================== */
class Gota {
  
  float x,y; // posición
  float escala; // escala
  PImage imagen; // imagen
  float velocidad; // velocidad
  
  Gota(float x, float vel, PImage miImagen) { // constructor
    this.x = x;
    this.escala = 0.1;
    this.velocidad = vel;
    this.imagen = miImagen;    
  } // fin del constructor
  
  // A) Método mover
  void mover() {
     y+= 1;
     if (y>height) {
       y=-100;
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
