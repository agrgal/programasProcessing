/* ===================================
  Animación coches
==================================== */

// Inicializo variables globales
PImage spriteCoche; // una imagen
Coches miCoche; // creo una variable de objeto de la clase Coches

// Inicializo el programa
void setup() { // inicializo todos los elementos
  size(1500,800); // tamaño de pantalla
  spriteCoche=loadImage("coche.png"); // Carga la imagen
  miCoche = new Coches(400,2,spriteCoche); // Inicializo la variable miCoche llamando al constructor con los parámetros
}

// ¡¡Nos movemos!!
void draw() {
  background(0,0,50); // Color de fondo.
  miCoche.mover(); // lamo al método mover de coche
  miCoche.mostrar(); // lamo al método mostrar 
}
