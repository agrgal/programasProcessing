class Snake {
 
  int longitud = 3;
  int direccion = 1; // 0 arriba, 1 derecha, 2 abajo y 3 izquierda
  int cuadrante = 0;
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
    this.miSnake.get(0).c = color(255,25,25); // marco la cabeza con el color rojo
  } // fin del construictor
  
  // =================
  // Métodos serpiente
  // =================
  void mostrar() { // método que muestra la serpiente
   // for (Cuadrado cada:miSnake) {cada.mostrar();}
   // Mejor la recorro en orden inverso.
   // De esta manera, cuando es muy larga, se le ve la cabeza siempre.
   for (int i = miSnake.size() - 1; i >= 0; i--) {
    Cuadrado cada = miSnake.get(i);
    cada.mostrar();
   }
  } // muestro los cuadrados de la serpiente
  
  // B) método que mueve la serpiente
  int mover(int di) {
    // calculo de coordenadas del primer cuadrado, y de los demás por consiguiente
    // A) Cálculo de la nueva coordenada del primero 
    // Si la dirección es 1, le suma el ancho a la X, si 3 se lo resta
    // Si la dirección es 2, le suma el ancho a la Y, si 0 se lo resta
    float nuevox = miSnake.get(0).x + (int(di==1))*this.ancho - (int(di==3))*this.ancho;
    float nuevoy = miSnake.get(0).y + (int(di==2))*this.ancho - (int(di==0))*this.ancho;
    // B) ¿Qué ocurre si el cambio de dirección es de 1 a 3 ó 0 a 2, y viceversa?
    this.cuadrante = cuadrante();
    // C) En caso de tropezar con el marco
    if (nuevox<3*this.ancho/2 || nuevox>this.tam-3*this.ancho/2 || nuevoy<3*this.ancho/2 || nuevoy>this.tam-3*this.ancho/2) {
      di = (di+1)%4; // cambia la dirección si choca con las paredes, girando 90º. Suma 1, teniendo en cuenta quie no puede ser 4.
      return di; // acaba la función 
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
    
    // F) refresco direccion
    this.direccion = di;
    
    // G) retorna dirección
    return di;
  } // fin del movimiento
  
  // C) Método que devuelve en qué cuadrante está  1, 2, 3 y 4.   1 --> 2 --> 3 --> 4
  int cuadrante() {
    float xx = miSnake.get(0).x; // obtengo las coordenadas de la cabeza.
    float yy = miSnake.get(0).y; 
    int valor = 1* int((xx>=tam/2) && (yy<tam/2)); // 1 si es el cuadrante superior derecho
    valor = valor + 2* int((xx>=tam/2) && (yy>=tam/2)); // 2 si es el cuadrante inferior derecho
    valor = valor + 3* int((xx<tam/2) && (yy>=tam/2)); // 3 cuadrante inferior izquierdo
    valor = valor + 4* int((xx<tam/2) && (yy<tam/2)); // 4 cuadrante inferior derecho
    // println("Cuadrante: "+str(valor));
    return valor; // devuelve el valor
  }
  
  // D) Método que te dice si está en la mitad superior o inferior
  // Hemisferio NS. Norte 1, Sur 0
  boolean hemisferioNS(){
   return cuadrante()==1 || cuadrante()==4;
  }
  
  // E) Método que te dice si está en la mitad izquierda o derecha
  // Hemisferio EO. Este 1, Oeste 0
  boolean hemisferioEO(){
   return cuadrante()==1 || cuadrante()==2;
  }
  
  // F) Método que calcula un array con el máximo y mínimo de la serpiente
  float[] zonaSnake(){
   float minx=1000, miny=1000, maxx=0,maxy=0; // inicialmente min valores muy grandes y max muy pequeños
   float[] a = new float[4]; // declaro un valor 
   for (Cuadrado cada:miSnake) {
      minx = minx* int(minx<=cada.x)+cada.x*int(minx>cada.x);
      miny = miny* int(miny<=cada.y)+cada.y*int(miny>cada.y);
      maxx = maxx* int(maxx>=cada.x)+cada.x*int(maxx<cada.x);
      maxy = maxy* int(maxy>=cada.y)+cada.y*int(maxy<cada.y);
   }
   a[0]=minx; a[1]=maxx; a[2]=miny; a[3]=maxy;  
   //Dibujo una caja que muestra la zona
   /* rectMode(CORNERS);
   stroke(22,22,255);
   noFill();
   rect(minx-this.ancho/2,miny-this.ancho/2,maxx+this.ancho/2,maxy+this.ancho/2); */
   return a;
  }
  
  // G) colisión zona Snake
  boolean colisionZonaSnake(float px, float py) {
    float[] a = zonaSnake();
    if ((px>=a[0] && px<=a[1]) && (py>=a[2] && py<=a[3])) {return true;} else {return false;}
  }
  
  
  // H) colisión cabeza - fruta
  boolean colisionCabezaFruta(Fruta laFruta) {
   if (miSnake.get(0).x==laFruta.xx && miSnake.get(0).y==laFruta.yy) {return true;} else {return false;} 
  }
  
  // HBIS) Autocolision
  boolean autoColision() {   
   Cuadrado cabeza = miSnake.get(0); // Obtengo el caudrado de la cabeza.
   // Recorro al revés, del último al 2º (posición i=1)
   for (int i = miSnake.size() - 1; i >= 1; i--) { 
    Cuadrado cada = miSnake.get(i);
    if (cada.x==cabeza.x && cada.y==cabeza.y) { return true; }
   }
   return false;
  }
  
  // I) Alargar serpiente
  void alargar(int mas) { // añado "mas" cuadrados a la serpiente
    // copio prácticamente las líneas del constructor, modificando lso rangos del for.
    int nC = int(0.5*tam/ancho); // tam --> tamaño ventana, ancho --> ancho cuadradito
    float centro = ancho/2+(nC-1)*ancho; // calculo la coordenada del cuadrado más cerca del centro.
    for (int i=this.longitud;i<this.longitud+mas;i++) {
       this.miSnake.add(new Cuadrado(centro-i*ancho,centro,ancho,this.c) ); // añade uno nuevo
       Cuadrado cada = miSnake.get(i); // recalcula las posiciones
       Cuadrado anterior = miSnake.get(i-1); 
       cada.x = anterior.x; cada.y = anterior.y;
    }
    this.longitud = this.miSnake.size(); // refresco la longitud de la serpiente
  } // FIN DEL MÉTODO alargar
  
}
