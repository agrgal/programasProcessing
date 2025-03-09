/* ========================================
CÓDIGO PRINCIPAL, LLUVIA ORDENADA
=========================================== */

PImage sprite;
// Gota miGota; // Modifico: creación de un array;
Gota[] misGotas = new Gota[50]; // con 50 elementos, del 0 al 49

void setup() {
  size(800,500);
  sprite = loadImage("gota.png");
  // miGota = new Gota(100,2,sprite); // Modifico. Creo 50 gotas
  for (int i=0;i<50;i++) {
    float xx = random(10,width-10);
    float yy = -1* random(75,125);
    float esc = random(0.1,0.8)*0.15;
    float vel = round(2+random(1,10));
    misGotas[i] = new Gota(xx,yy,esc,vel,sprite);
  }
}

void draw() {
  background(0,150,255); 
  for (int i=0;i<50; i++) {
      misGotas[i].mover();
      misGotas[i].mostrar();
  }

}
