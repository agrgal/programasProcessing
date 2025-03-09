class Marco {
  
 float aC;
 color c;
 int contar = 0;
 ArrayList<Cuadrado> misCuadrados = new ArrayList<Cuadrado>(); // Array vacío
 
 Marco (float miAncho, color miColor, float screenSize) { // Construyendo el marco
   this.aC = miAncho;
   this.c = miColor;
   // el uso de screenSize para xx e yy implica que la pantalla debe ser cuadrada.
   for (float xx=this.aC/2; xx< screenSize;xx+=this.aC) {
       for (float yy=this.aC/2; yy<screenSize ;yy+=this.aC) {
            if (xx<this.aC || yy<this.aC || xx>screenSize-this.aC || yy>screenSize-this.aC) {
               // si xx o yy es menor que el ancho, su centro tiene una coordenada tm/2
               // o bien xx o yy tiene el centro mayor que tamañoVentana menos ancho
               this.misCuadrados.add(new Cuadrado(xx,yy,this.aC,c));
               print("["+str(xx)+","+str(yy)+"] ");
               this.contar +=1;
            }  // fin del if. Solo los cuadros cutos centros tengan una coordenada menor que la mitad       
       } // fin del for yy
   } // fin del for de xx
 } // Fin del constructor
  
 void mostrar() { // mostrando el marco
   for (Cuadrado cada:misCuadrados) {
     cada.mostrar();
   }
 } // fin de mostrar  
  
}
