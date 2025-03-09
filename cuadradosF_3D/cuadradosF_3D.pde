int maxNivel = 8;
ArrayList<Cubo> miCubo = new ArrayList<Cubo>(); //mejor defino de esta manera
float tm = 20;
color miColor = color(20,20,220);
float centroX = 0;
float centroY = 0;
int contar = 0;

void setup() {
 size(800,800,P3D); // pongo en 3 dimensiones
 // centroX = width/2;
 // centroY = height/2;
 for (int nivel=0;nivel<=maxNivel;nivel++) { // pongo desde nivel 0 y así tb dibujo el del medio.
 // recorro desde -nivel hasta +nivel  
 // Ejemplo, si nivel =2. Recorro desde -2 a 2  [-2, -1, 0, 1, 2]
     for (int i=-nivel;i<=nivel;i++) {  
        for (int j=-nivel;j<=nivel;j++) {
          if(abs(i)==nivel || abs(j)==nivel) { // Solo cuenta los que tienen una coordenada con nivel.
            print("["+str(i)+","+str(j)+"] "); 
            // Usando ArrayList<Cuadrado> después puedo poner add
            miCubo.add(new Cubo(centroX+i*tm,centroY+j*tm,0,tm,miColor));
            contar +=1;
          } // fin del if     
     } } } // fin de los for
 println("cuantos: "+str(contar));
}

void draw() {
 background(0,0,50);
 
 // Centra la escena
  translate(width/2, height*.7);
  
  // Aplica rotaciones para la vista isométrica
  rotateX(radians(2*35.264)); // Aproximadamente 2 * arctan(1/√2)
  rotateZ(radians(30)); // 30º
  
 for (Cubo cada:miCubo) {
     cada.mostrar(); 
 }
}
