PImage img;

void setup() {
  size(1600, 1196);
  img = loadImage("probando.jpeg");
  image(img, 0, 0);
  
  filter(GRAY);  // Convertir la imagen a escala de grises
}

void draw() {
  // Aquí se pueden aplicar más transformaciones a la imagen
}
