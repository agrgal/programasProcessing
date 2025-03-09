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
  
  // C) Detectar la colisión con el paraguas
  boolean colisionConUnParaguas(Paraguas p) {    
    float centroX = x + (imagen.width * escala / 2); // Usamos el centro de la gota para la detección
    float abajoY = y + (imagen.height * escala); // parte más baja
    return p.colision(centroX, abajoY);
  }

  void reiniciar() {
    y = -1 * random(75, 125);
    x = random(10, width - 10);
  }
  
} // fin de la clase
