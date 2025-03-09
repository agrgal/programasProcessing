class Snake {
 
  int longitud = 3;
  int direccion = 1; // 0 arriba, 1 derecha, 2 abajo y 3 izquierda
  color c;
  float ancho; // ancho del cuadradito
  float tam; // tamaño de la ventana
  ArrayList<Cuadrado> miSnake = new ArrayList<Cuadrado>(); // Array vacío
  
  Snake (int lg, int di, color miColor, float miAncho, float screenSize) {
    this.longitud = lg;
    this.direccion = di;
    this.c = miColor;
    this.ancho = miAncho;
    this.tam = screenSize;
    int nC = int(0.5*screenSize/miAncho); // la mitad del nº cuadrados de ancho o largo
    float centro = miAncho/2+(nC-1)*miAncho; // calculo la coordenada del cuadrado más cerca del centro.
    for (int i=0;i<this.longitud;i++) {
       this.miSnake.add(new Cuadrado(centro-i*miAncho,centro,miAncho,miColor) ); 
       // Al cuadrado 0, lo pone en las coordenadas centro,centro.
       // Al 1 en centro-miAncho, centro, al 2 en centro-2*miAncho,centro.... 
    } // for que conforma los cuadrados de la serpiente
  } // fin del construictor
  
  // =================
  // Métodos serpiente
  // =================
  void mostrar() { // método que muestra la serpiente
   for (Cuadrado cada:miSnake) {
     cada.mostrar();
   }
  } // muestro los cuadrados de la serpiente
  
  // B) método que mueve la serpiente
  void mover(int di) {
    // calculo de coordenadas del primer cuadrado
    // A) ¿Qué ocurre si el cambio de dirección es de 1 a 3 ó 0 a 2, y viceversa?
    
    // B) Cálculo de la nueva coordenada del primero 
    // Si la dirección es 1, le suma el ancho a la X, si 3 se lo resta
    // Si la dirección es 2, le suma el ancho a la Y, si 0 se lo resta
    float nuevox = miSnake.get(0).x + (int(di==1))*this.ancho - (int(di==3))*this.ancho;
    float nuevoy = miSnake.get(0).y + (int(di==2))*this.ancho - (int(di==0))*this.ancho;
    // C) En caso de tropezar con el marco
    if (nuevox<3*this.ancho/2 || nuevox>this.tam-3*this.ancho/2 || nuevoy<3*this.ancho/2 || nuevoy>this.tam-3*this.ancho/2) {
      return; // acaba la función 
    } // Lo que ocurre si se sale del marco.
    // D) Coordenadas de la fila, excepto el primero
    for (int i = miSnake.size() - 1; i >= 1; i--) { // recorro los cuadrados al reves. El primero, el número 0,  NO
        Cuadrado cada = miSnake.get(i); // obtengo cada cuadrado
        Cuadrado anterior = miSnake.get(i-1); // obtengo el que le precede 
        cada.x = anterior.x; cada.y = anterior.y; // traspaso las coordenadas del anterior al cuadrado
    }
    // E) Coordenadas del primer cuadrado
    miSnake.get(0).x=nuevox; 
    miSnake.get(0).y=nuevoy;
    // F) Refresco de la dirección de la serpiente
    this.direccion = di; // la variable que me pasa se la asigno a la serpiente
  }
  
}
