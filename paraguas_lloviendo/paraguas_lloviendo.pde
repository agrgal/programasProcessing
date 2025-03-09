/* ========================================
CÓDIGO PRINCIPAL, LLUVIA Desordenada y Paraguas
=========================================== */

PImage sprite, sprite2;
Gota[] misGotas = new Gota[50]; // con 50 elementos, del 0 al 49
Paraguas miParaguas;

void setup() {
  size(800,500);
  sprite = loadImage("gota.png");
  sprite2 = loadImage("paraguas.png");
  miParaguas= new Paraguas(-200,height-205,0.2,1,sprite2);
  for (int i=0;i<50;i++) {
    float xx = random(10,width-10);
    float yy = -1* random(75,125);
    float esc = random(0.1,0.8)*0.15;
    float vel = round(2+random(1,5));
    misGotas[i] = new Gota(xx,yy,esc,vel,sprite);
  }
}

void draw() {
  background(0,150,255);
  
  miParaguas.mover();
  miParaguas.mostrar();
  
  for (int i=0;i<50; i++) {
    
      if (misGotas[i].colisionConUnParaguas(miParaguas)==true) {
        misGotas[i].reiniciar();
      } else {
        misGotas[i].mover();      
      }       
      // misGotas[i].mover();
      misGotas[i].mostrar();
  }

}
