int maxNivel = 10;
// Cuadrado miCuadrado[]; // defino sin tamaño el array miCuadrado
ArrayList<Cubo> miCubo = new ArrayList<Cubo>(); //mejor defino de esta manera
float tm = 20;
color miColor = color(20,20,220);
float centroX = 0;
float centroY = 0;
int contar = 0;

// control de rotaciones
float rotX = 0;
float rotY = 0;
float rotZ = 0;

void setup() {
 size(800,800,P3D); // pongo en 3 dimensiones
 for (int escalon=maxNivel; escalon>=0; escalon--) { // pirámide escalonada
   // float miZ = escalon*tm; // Esa es miZ --> pero con esta orden sale al revés
   float miZ = (maxNivel-escalon)*tm; // Esa es miZ, con los valores al revés
   color miColor = color((escalon%2)*20*maxNivel,(escalon%maxNivel)*20,100+(escalon%2)*10); // cambio de color con la altura
   for (int nivel=0;nivel<=escalon;nivel++) { // pongo desde nivel 0 y así tb dibujo el del medio.
   // recorro desde -nivel hasta +nivel  
   // Ejemplo, si nivel =2. Recorro desde -2 a 2  [-2, -1, 0, 1, 2]
       for (int i=-nivel;i<=nivel;i++) {  
          for (int j=-nivel;j<=nivel;j++) {
            if(abs(i)==nivel || abs(j)==nivel) { // Solo cuenta los que tienen una coordenada con nivel.
              print("["+str(i)+","+str(j)+"] ");                   // Usando ArrayList<Cuadrado> después puedo poner add
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
  translate(width/2, height*0.5);
  
  // Aplica rotaciones basadas en la posición del ratón
  rotateX(rotX);
  rotateY(rotY);
  rotateZ(rotZ);
  
 for (Cubo cada:miCubo) {
     cada.mostrar(); 
 }
 
}

void mouseDragged() {
  float factor = 0.01;
  rotY += (mouseX - pmouseX) * factor; // posición del mouse menos la posición anterior
  rotX -= (mouseY - pmouseY) * factor;
}

void mouseWheel(MouseEvent event) {
  float e = event.getCount();
  rotZ += e * 0.1;
}
