/* ========================================
CÓDIGO PRINCIPAL
=========================================== */

PImage sprite;
// Gota miGota; // Modifico: creación de un array;
Gota[] misGotas = new Gota[50]; // con 50 elementos, del 0 al 49

void setup() {
  size(800,500);
  sprite = loadImage("gota.png");
  // miGota = new Gota(100,2,sprite); // Modifico. Creo 50 gotas
  for (int i=0;i<50;i++) {
    misGotas[i] = new Gota(10+i*15,2,sprite);
  }
}

void draw() {
  background(0,150,255); 
  for (int i=0;i<50; i++) {
      misGotas[i].mover();
      misGotas[i].mostrar();
  }

}
