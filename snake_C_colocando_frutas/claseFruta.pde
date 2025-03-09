class Fruta {
 
  float xx, yy;
  color c;
  Cuadrado miFruta;
  
  Fruta (float miAncho,float screenSize, color miColor) {
    int numCuadrados = int(screenSize/miAncho); // nº cuadrados en la ventana.
    int numx = int(random(2,numCuadrados-1));
    int numy = int(random(2,numCuadrados-1));
    float px = miAncho/2+(numx-1)*miAncho; float py = miAncho/2+(numy-1)*miAncho;
    this.xx = px; // asigna las coordenadas
    this.yy = py; // asigna las coordenadas
    this.c= miColor; // asigna el color.
    this.miFruta = new Cuadrado(px,py,miAncho,miColor); // por fin creo un cuadrado que representa la fruta
  }
  
  void mostrar() {
      miFruta.mostrar();
  }
  
}
