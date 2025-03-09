int maxNivel = 8;
// Cuadrado miCuadrado[]; // defino sin tamaño el array miCuadrado
ArrayList<Cubo> miCubo = new ArrayList<Cubo>(); //mejor defino de esta manera
float tm = 20;
color miColor = color(20,20,220);
float centroX = 0;
float centroY = 0;
int contar = 0;
float anguloRotacion = 0; // incluyo ángulo de rotación

void setup() {
 size(800,800,P3D); // pongo en 3 dimensiones
 for (int escalon=2*maxNivel; escalon>=0; escalon--) { // Doblo el número de escalones
   float miZ = (2*maxNivel-escalon)*tm; // Tengo una pirámide más alta
   color miColor = color((escalon%2)*20*maxNivel,(escalon%maxNivel)*20,100+(escalon%2)*10); // cambio de color con la altura
   // IMPORTANTE: para que salga reflejada, tengo que restar la mitad del total de escalones (o sea, maxNivel)
   // de la variables escalon. Así salen los valores reflejados
   
   // O un for o el otro
   // =================================================================
   for (int nivel=0;nivel<=maxNivel-abs(maxNivel-escalon);nivel++) { // Reflejada por el nivel 0
   // for (int nivel=0;nivel<=abs(maxNivel-escalon);nivel++) { // Reflejada por el nivel maxNivel
   // =================================================================   
   // recorro desde -nivel hasta +nivel  
   // Ejemplo, si nivel =2. Recorro desde -2 a 2  [-2, -1, 0, 1, 2]
       for (int i=-nivel;i<=nivel;i++) {  
          for (int j=-nivel;j<=nivel;j++) {
            if(abs(i)==nivel || abs(j)==nivel) { // Solo cuenta los que tienen una coordenada con nivel.
              // print("["+str(i)+","+str(j)+"] ");                   // Usando ArrayList<Cuadrado> después puedo poner add
              // Usando ArrayList<Cuadrado> después puedo poner add
              miCubo.add(new Cubo(centroX+i*tm,centroY+j*tm,miZ,tm,miColor)); // cambio la altura
              contar +=1;
            } // fin del if     
       } } } // fin de los for
 } // fin del escalon
 
 // miCuadrado = new Cuadrado(width/2,height/2,tm, miColor);
 println("cuantos: "+str(contar));
}

void draw() {
 background(220 ,220,250);
 
 // Centra la escena
  translate(width/2, height*.7);
  
  // Aplica rotaciones para la vista isométrica
  rotateX(radians(2*35.264)); // Aproximadamente 2 * arctan(1/√2)
  rotateZ(radians(30 + anguloRotacion)); // 30º
  
 for (Cubo cada:miCubo) {
     cada.mostrar(); 
 }
 
 anguloRotacion +=0.5;
}
