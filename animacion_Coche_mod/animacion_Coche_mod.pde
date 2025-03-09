/* ===================================
  Animación coches
==================================== */

// Inicializo variables globales
PImage spriteCoche; // una imagen
Coches miCoche; // creo una variable de objeto de la clase Coches

// Inicializo el programa
void setup() { // inicializo todos los elementos
  size(1500,200); // tamaño de pantalla
  spriteCoche=loadImage("coche.png"); // Carga la imagen  
  // 1) Hago que el coche sea más pequeño introduciendo un parámetro de escala y eligeindo una escala más pequeña.
  // 3) pongo la vleocidad aleatoria. Pero además hay que recalcularla cada vez que salga por la pantalla, y eso se hace en la clase. 
  miCoche = new Coches(height/2,0.2,random(1,10),spriteCoche); // Inicializo la variable miCoche llamando al constructor con los parámetros
  // 2) Consigo que el coche vaya siempre a mitad de la línea modificando la altura en función de la altura de la pantalla, la escala y la altura de la imagen
  miCoche.y=height/2-miCoche.escala*miCoche.miImagen.height/2;  
}

// ¡¡Nos movemos!!
void draw() {
  background(0,150,150); // Color de fondo.
  stroke(255,255,255);
  line(0,height/2,width,height/2); // dibujo una línea a la mitad
  
  miCoche.mover(); // lamo al método mover de coche
  miCoche.mostrar(); // lamo al método mostrar 
}
