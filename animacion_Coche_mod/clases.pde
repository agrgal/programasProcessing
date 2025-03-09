class Coches {

  // Zona de atributos
  // Definimos las propiedades del coche
  float x,y; // posición en pantalla
  float velocidad; // velocidad del coche
  float escala; // tamaño del coche
  PImage miImagen; // sprite 
  PImage miImagenOriginal; // sprite original
  
  // Método inicial o constructor
  Coches(float posY, float escala, float velIni, PImage imagen) { 
  // al instanciarlo , le pasamos dos parámetros: la posición Y en la pantalla y la velocidad inicial.
  // palabra reservada this, que viene a significar "este objeto"
    this.x = -200; // empezamos a la izquierda de la pantalla
    this.y = posY; // asigno la posición Y inicial 
    this.velocidad = velIni; // asigno la velocidad Y inicial 
    this.escala = escala; // empiezo con escala 1
    this.miImagen = imagen; // asigno la imagen de sprite
    this.miImagenOriginal = imagen; // también hago una copia. Necesario en paso 4. 
  }
  
  // Zona de métodos
  
  // A) Método que permite mover el coche de izquierda a derecha
  void mover() {
   x = x + velocidad; // aumento la posición x según la velocidad
   if (x>width) { // si me paso, empezará a la izquierda de nuevo.
     x=-200;  
     velocidad = random(1,10); // 3) y además modifico su velocidad
     println(velocidad);
     // 4) Llamo a la funció nque cambia de color
     ajustarTonoSaturacion();
   }
  } // FIN del método mover 
  
  // B) método para mostrar el coche en pantalla
  void mostrar() { 
    pushMatrix();
    translate(x, y);
    scale(escala);
    image(miImagen, 0, 0);
    popMatrix();
  }
  
  // C) Cuestión 4. Función que ajusta el tono y la saturación de la imagen 
  void ajustarTonoSaturacion() {
     miImagen = miImagenOriginal.copy(); // copia siempre la original en la que se cambia. 
     miImagen.loadPixels();
     colorMode(HSB, 360, 100, 100,100);
     
     float valor1 = random(0,360);
     float valor2 = random(0,2);
     
     for (int i = 0; i < miImagen.pixels.length; i++) {
        color c = miImagen.pixels[i];
        float h = hue(c);
        float s = saturation(c);
        float b = brightness(c);
        float a = alpha(c);
        
        if (a!=255) {  // Sólo calcula el cambio para valores que no tengan a=255, o sea, que no sean transparentes.     
            h = (h + valor1) % 360;
            s = constrain(s * valor2, 0, 100);
        }
        
        miImagen.pixels[i] = color(h, s, b, a);
      }
  
      miImagen.updatePixels();
      colorMode(RGB, 255);
  } /// Fin de ajustar Tono y saturación
  
} // fin de la clase
