int centerX, centerY = 0;
int i = 0; // contador
float radio, angulo = 0;
int valor =0;
color c = color(0,0,0);
int[] numeros = {20,1,18,4,13,6,10,15,2,17,3,19,7,16,8,11,14,9,12,5};
PFont f; // objeto tipo fuente

// ***************************
// Función que dibuja un sector
// ***************************
void dibujarSector(float x, float y, float anguloInicial, float anguloFinal, float radioInterno, float radioExterno, color c) {
  // Configurar el color del sector
  noFill();
  stroke(c);  // color de borde
  // paso del ángulo y variable ángulo
  float pasoangular = 0.05; // más definido
  float angulo = 0.0;  
  for (angulo=anguloInicial ; angulo<=anguloFinal; angulo=angulo+pasoangular) {
    line(x+radioInterno*cos(radians(angulo)),y+ radioInterno*sin(radians(-angulo)),x+radioExterno*cos(radians(angulo)), y+radioExterno*sin(radians(-angulo)));
  } 
}

// ***************************
// PROGRAMA PRINCIPAL
// ***************************
void setup() {
 size(600,600);
 background(255);
 f = createFont("Arial Bold",16,true); // crear la fuente
 noLoop();
}

void draw(){
   centerX = width/2;
   centerY = height/2;
   radio=0.95*width/2; // casi el ancho
   
   for (angulo=0; angulo<=360;angulo=angulo+18) {      
      // diana 
      valor = int(angulo/18)%2;
      dibujarSector(centerX,centerY,angulo+9,angulo+18+9,0,radio*0.85, color(255*valor,255*valor,255*valor));      
      // sectores
       dibujarSector(centerX,centerY,angulo+9,angulo+18+9,radio*0.8,radio*0.85,color(255-255*valor,255*valor,0));
       dibujarSector(centerX,centerY,angulo+9,angulo+18+9,radio*0.4,radio*0.45,color(255-255*valor,255*valor,0));       
      // Corona exterior negra de fuera
      dibujarSector(centerX,centerY,angulo+9,angulo+18+9,radio*0.85,radio*0.98,color(0));
   }
      
  
   for (angulo=0; angulo<=360;angulo=angulo+18) {    
      // Círculos interiores
      dibujarSector(centerX,centerY,angulo+9,angulo+18+9,0,radio*0.07,color(0,255,0));
      dibujarSector(centerX,centerY,angulo+9,angulo+18+9,0,radio*0.03,color(255,0,0));
   }

    angulo = 0;
    for (i=0;i<numeros.length;i=i+1) {
      textFont(f,28);
      textAlign(CENTER);
      fill(255);
      angulo = i*360/(numeros.length)-90;
      text(numeros[i],centerX+(radio*0.91)*cos(radians(angulo)),10+centerY+(radio*0.91)*sin(radians(angulo)));
    } 
  
}
