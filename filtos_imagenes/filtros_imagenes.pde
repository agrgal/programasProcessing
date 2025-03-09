PImage imagen;
PImage resultado;

void setup() {
  size(1600, 1196);
  imagen = loadImage("probando.jpeg");
  resultado = createImage(imagen.width, imagen.height, RGB);
  
  imagen.loadPixels();
  resultado.loadPixels();
  
  for (int y = 1; y < imagen.height - 1; y++) {
    for (int x = 1; x < imagen.width - 1; x++) {
      float sumR = 0, sumG = 0, sumB = 0;
      
      for (int ky = -1; ky <= 1; ky++) {
        for (int kx = -1; kx <= 1; kx++) {
          int pos = (y + ky) * imagen.width + (x + kx);
          color c = imagen.pixels[pos];
          sumR += red(c);
          sumG += green(c);
          sumB += blue(c);
        }
      }
      
      resultado.pixels[y * imagen.width + x] = color(sumR/9, sumG/9, sumB/9);
    }
  }
  
  resultado.updatePixels();
}

void draw() {
  image(resultado, 0, 0);
}
