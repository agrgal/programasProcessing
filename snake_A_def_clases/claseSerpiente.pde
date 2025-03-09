class Snake {
 
  int longitud = 3;
  int direccion = 1; // 0 arriba, 1 derecha, 2 abajo y 3 izquierda
  color c;
  ArrayList<Cuadrado> miSnake = new ArrayList<Cuadrado>(); // Array vacío
  
  Snake (int lg, int di, color miColor, float miAncho, float screenSize) {
    this.longitud = lg;
    this.direccion = di;
    this.c = miColor;
    float centro = screenSize/2; // es un cuadrado
    for (int i=0;i<this.longitud;i++) {
       this.miSnake.add(new Cuadrado(centro-i*miAncho,centro,miAncho,miColor) );  
    } // for que conforma los cuadrados de la serpiente
  } // fin del construictor
  
  void mostrar() {
   for (Cuadrado cada:miSnake) {
     cada.mostrar();
   }
  } // muestros los cuadrados de la serpiente
  
}
