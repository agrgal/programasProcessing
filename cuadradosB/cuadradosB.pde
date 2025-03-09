int nivel = 3;
// Cuadrado miCuadrado[] = new Cuadrado[8*nivel];
// float tm = 60;
// color miColor = color(20,20,220);
// float centroX = width/2;
// float centroY = height/2;
float contar = 0;

void setup() {
 size(800,800);
 for (int i=-nivel;i<=nivel;i++) {
    for (int j=-nivel;j<=nivel;j++) {
      if(abs(i)==nivel || abs(j)==nivel) {
        print("["+str(i)+","+str(j)+"] ");
        contar +=1;
      }
     
 } }
 // miCuadrado = new Cuadrado(width/2,height/2,tm, miColor);
 print("cuantos: "+str(contar));
}

void draw() {
 background(0,0,50);
 // miCuadrado.mostrar();
}
