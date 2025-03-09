PImage imagen;

void setup() {
  size(1600, 1196);
  imagen = loadImage("probando.jpeg");
  imagen.loadPixels();
  
  for (int i = 0; i < imagen.pixels.length; i++) {
    color pixel = imagen.pixels[i];
    
    // Invertir los componentes RGB
    float r = 255 - red(pixel);
    float g = 255 - green(pixel);
    float b = 255 - blue(pixel);
    
    // Asignar el nuevo color al píxel
    imagen.pixels[i] = color(r, g, b);
  }
  
  imagen.updatePixels();
}

void draw() {
  image(imagen, 0, 0);
}
