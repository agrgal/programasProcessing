float angulo = 0;
float radio = 0;
int anchoCoronas = 16;
float inicioA = 0; // inicio y fin de líneas
float finalA = 0;
int i,j = 0; // contadores
int valor = 0;
/* int[] numeros = {20,1,18,4,13,6,10,15,2,17,3,19,7,16,8,11,14,9,12,5}; 
PFont f; // objeto tipo fuente */
  
void setup() {
  /* // f = createFont("Arial Bold",16,true); // crear la fuente */
  size(600, 600);  // Tamaño de la ventana
  noLoop();  // Dibujar solo una vez
}

void draw() {
  background(255);  // Fondo blanco
  
  // Centro de la diana
  float centerX = width / 2;
  float centerY = height / 2;
  
  // Radio
  float radio = centerX*0.85;  
 
  // Círculo de fondo negro
  fill(0); ellipse(centerX,centerY,2*centerX,2*centerY); // círculo negro fondo
  noFill(); stroke(255); ellipse(centerX,centerY,2*centerX-10,2*centerY-10); // línea en blanco

  // Sectores
  fill(255);
  ellipse(centerX,centerY,1+radio*2,1+radio*2); // círculo delimitador
  for (angulo=0; angulo<=360; angulo=angulo+0.1) { // 360/20 sectores da 18. Cada sector debe tener 18 grados.
   // if (int(angulo/18)%2==0) { stroke(255); } else {stroke(0);}
   valor = int(angulo/18)%2;
   stroke(255*valor, 255*valor, 255*valor);
   line(centerX,
        centerY,
        centerX+cos(radians(angulo+9))*radio,
        centerY+sin(radians(angulo+9))*radio
        ); //rectifico al centro 9 grados
  } 
  
  // Sectores rojos y verdes
  for (j=0; j<2; j=j+1) {
    inicioA = radio - j*radio/2+j*radio/16;
    finalA = inicioA-20;
    for (angulo=0; angulo<=360; angulo=angulo+0.1) {
     // if (int(angulo/18)%2==0) { stroke(0,255,0); } else {stroke(255,0,0);}
     valor = int(angulo/18)%2;
     stroke(255*valor, 255-255*valor,0);
     line(centerX+cos(radians(angulo-9))*inicioA,
          centerY+sin(radians(angulo-9))*inicioA,
          centerX+cos(radians(angulo-9))*finalA,
          centerY+sin(radians(angulo-9))*finalA);
    } 
  }
  fill(0,255,0); ellipse(centerX,centerY,40,40); //rojo
  fill(255,0,0); ellipse(centerX,centerY,20,20); // verde
  
  /*
  // Números. Difícil
  for (i=0;i<numeros.length;i=i+1) {
    textFont(f,28);
    textAlign(CENTER);
    fill(255);
    angulo = i*360/(numeros.length)-90;
    text(numeros[i],centerX+(radio*1.08)*cos(radians(angulo)),10+centerY+(radio*1.08)*sin(radians(angulo)));
  } */  
  
} // fin del script
