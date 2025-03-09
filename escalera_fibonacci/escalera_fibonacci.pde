float phi = (1+sqrt(5))/2;
float ancho = 13;
float alto =8;
float angulo = 0;
int i = 0;

void setup() {
  size(800, 800);
  background(255);
  noLoop();
}

void draw() {
  
  stroke(125); // color del trazo
  noFill(); // sin rellenar
  
  translate(width/2,height/2);
  
  // Hago un for que recorra al menos 20 dibujos
  for (i=0; i<20;i++) {
    // primero, dibujo el rectángulo
    rect(0,0,ancho,-alto); // de base ancho y lado alto;
    // Segundo, calculo el ángulo de rotación
    angulo = atan(-alto/ancho);
    print(angulo);
    // Tercero, roto el punto de referencia
    rotate(angulo);
    // Cuarto, calculo nuevo ancho y alto:
    // El ancho, es la diagonal de antes y el alto, esa diagonal por el número aúreo
    float diagonal = sqrt(pow(ancho,2)+pow(alto,2));
    ancho = diagonal;
    alto = ancho/phi;          
  }  
}
