int nivel = 4;
ArrayList<Cuadrado> miCuadrado = new ArrayList<Cuadrado>(); //mejor defino de esta manera
float tm = 80;
color miColor = color(20,20,220);
float centroX = 0;
float centroY = 0;
int contar = 0;

void setup() {
 size(800,800);
 textSize(14);
 centroX = width/2;
 centroY = height/2;
 // recorro desde -nivel hasta +nivel  
 // Ejemplo, si nivel =2. Recorro desde -2 a 2  [-2, -1, 0, 1, 2]
 for (int i=-nivel;i<=nivel;i++) {  
    for (int j=-nivel;j<=nivel;j++) {
      // if(abs(i)==nivel || abs(j)==nivel) { // Solo cuenta los que tienen una coordenada con nivel.
        println(i,j);        
        miCuadrado.add(new Cuadrado(centroX+i*tm,centroY+j*tm,tm,miColor,i,j));
        contar +=1;
      // } // fin del if     
 } } // fin de los for
 // miCuadrado = new Cuadrado(width/2,height/2,tm, miColor);
 println("cuantos: "+str(contar));
}

void draw() {
 background(220,220,200);
 // miCuadrado.mostrar();
 for (Cuadrado cada:miCuadrado) {
    if (abs(cada.i)==nivel || abs(cada.j)==nivel) {
       cada.mostrar();   
       cada.punto();
    }    
    cada.coordenada();
 }
}
