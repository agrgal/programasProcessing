int sizeVentana = 800;
int anchoCuadradito = 20;
float contar = 0;

 // Marco de la ventana: tamaño cuadro, color, tamaño de la ventana
 // para que se vea bien , el tamaño del cuadro debe ser un submúltiplo del tamaño de la ventana
Marco miMarco = new Marco(anchoCuadradito,color(134),sizeVentana);
Snake sss = new Snake(3,1,color(25,255,25),anchoCuadradito,sizeVentana);

void setup() {
 size(40,40); // totalmente cuadrada. Cualquier valor
 surface.setSize(sizeVentana,sizeVentana); // redefinición del alto y ancho de la ventana
}

void draw() { 
 background(0,0,50);
 // A) Mostrar marco de juego;
 miMarco.mostrar();
 // B) Muestro la serpiente
 sss.mostrar();
 
}
