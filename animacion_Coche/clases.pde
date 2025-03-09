class Coches {

  // Zona de atributos
  // Definimos las propiedades del coche
  float x,y; // posición en pantalla
  float velocidad; // velocidad del coche
  float escala; // tamaño del coche
  PImage miImagen; // sprite 
  
  // Método inicial o constructor
  Coches(float posY, float velIni, PImage imagen) { 
  // al instanciarlo , le pasamos dos parámetros: la posición Y en la pantalla y la velocidad inicial.
  // palabra reservada this, que viene a significar "este objeto"
    this.x = -200; // empezamos a la izquierda de la pantalla
    this.y = posY; // asigno la posición Y inicial 
    this.velocidad = velIni; // asigno la velocidad Y inicial 
    this.escala = 1; // empiezo con escala 1
    this.miImagen = imagen; // asigno la imagen de sprite
  }
  
  // Zona de métodos
  
  // 1) Método que permite mover el coche de izquierda a derecha
  void mover() {
   x = x + velocidad; // aumento la posición x según la velocidad
   if (x>width) { // si me paso, empezará a la izquierda de nuevo.
     x=-200;  
   }
  } // FIN del método mover 
  
  // 2) método para mostrar el coche en pantalla
  void mostrar() { 
    pushMatrix();
    translate(x, y);
    scale(escala);
    image(miImagen, 0, 0);
    popMatrix();
  }
  
} // fin de la clase
