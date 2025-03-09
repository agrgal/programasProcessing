Cuadrado miCuadrado;
float tm = 80;
color miColor = color(200,200,200);

void setup() {
 size(800,800);
 miCuadrado = new Cuadrado(width/2,height/2,tm, miColor);
}

void draw() {
 background(0,0,50);
 miCuadrado.mostrar();
}
