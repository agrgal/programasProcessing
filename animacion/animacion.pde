int numGotas = 50;
Gota[] gotas = new Gota[numGotas];
PImage spriteLluvia;

void setup() {
  size(900, 1000);
  spriteLluvia = loadImage("gota.png"); // Asegúrate de tener una imagen "gota.png" en la carpeta de tu sketch
  for (int i = 0; i < numGotas; i++) {
    gotas[i] = new Gota();
  }
}

void draw() {
  background(0, 0, 50); // Fondo azul oscuro  
  for (Gota gota : gotas) {
    gota.caer();
    gota.mostrar();
  }
}
