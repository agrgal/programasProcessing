int maxNivel = 8;
// Cuadrado miCuadrado[]; // defino sin tamaño el array miCuadrado
ArrayList<Cuadrado> miCuadrado = new ArrayList<Cuadrado>(); //mjor defino de esta manera
float tm = 20;
color miColor = color(20,20,220);
float centroX = 0;
float centroY = 0;
int contar = 0;

void setup() {
 size(800,800);
 centroX = width/2;
 centroY = height/2;
 for (int nivel=0;nivel<=maxNivel;nivel++) { // pongo desde nivel 0 y así tb dibujo el del medio.
 // recorro desde -nivel hasta +nivel  
 // Ejemplo, si nivel =2. Recorro desde -2 a 2  [-2, -1, 0, 1, 2]
     for (int i=-nivel;i<=nivel;i++) {  
        for (int j=-nivel;j<=nivel;j++) {
          if(abs(i)==nivel || abs(j)==nivel) { // Solo cuenta los que tienen una coordenada con nivel.
            println(i,j);        
            // Usando ArrayList<Cuadrado> después puedo poner add
            miCuadrado.add(new Cuadrado(centroX+i*tm,centroY+j*tm,tm,miColor));
            contar +=1;
          } // fin del if     
     } } } // fin de los for
 // miCuadrado = new Cuadrado(width/2,height/2,tm, miColor);
 println("cuantos: "+str(contar));
}

void draw() {
 background(0,0,50);
 for (Cuadrado cada:miCuadrado) {
     cada.mostrar(); 
 }
}
