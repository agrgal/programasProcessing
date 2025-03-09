int sizeVentana = 600;
int anchoCuadradito = 10;
int longitudSnake = 3;
float contar = 0;

// Animando nuestra serpiente
float vel = 4; // velocidad del juego
int direccion=0; // direccion inicial

// Dando puntuacion al juego
int puntos = 0;

 // Marco de la ventana: tamaño cuadro, color, tamaño de la ventana
 // para que se vea bien , el tamaño del cuadro debe ser un submúltiplo del tamaño de la ventana
Marco miMarco = new Marco(anchoCuadradito,color(134),sizeVentana);
Snake sss = new Snake(longitudSnake,direccion,color(25,255,25),anchoCuadradito,sizeVentana);
Fruta unaFruta = new Fruta (anchoCuadradito,sizeVentana, color(0,255,255)); // creando una fruta

//==========================
// SETUP
// =========================
void setup() {
 size(40,40); // totalmente cuadrada. Cualquier valor
 surface.setSize(sizeVentana,int(sizeVentana*1.2)); // redefinición del alto y ancho de la ventana. Margen para poner información
 // Para que recalcule dónde mostrar la fruta, si está dentro de la zona de influencia de la serpiente creada
 while(sss.colisionZonaSnake(unaFruta.xx,unaFruta.yy)) {
    unaFruta = new Fruta (anchoCuadradito,sizeVentana, color(0,255,255)); // vuelvo a crear el objeto;
 }
}

//==========================
// DRAW
// =========================
void draw() { 
 background(0,0,50);
 // 0) Líneas de referencia
 stroke(255);
 line(sizeVentana/2,0,sizeVentana/2,sizeVentana);
 line(0,sizeVentana/2,sizeVentana,sizeVentana/2);
 noStroke();
 
  // Nueva direccion
 obtenerDireccion(); // compruebo si la he cambiado
  
 // ============================================
 // JUEGO
 // ============================================
 // A) Mostrar marco de juego;
 miMarco.mostrar();
 // A1) Muestra la fruta;
 unaFruta.mostrar();
  
 // B) lo muevo, en la direccion "direccion" 
if (abs(direccion-sss.direccion)==2) { // si hay un cambio que implica una dirección de 2
   if (sss.hemisferioNS() && (direccion%2==1)) { sss.mover(2); sss.mostrar();} // lo baja una línea. hemisferio norte y paso de izquierda a derecha
   else if (!(sss.hemisferioNS()) && (direccion%2==1)) { sss.mover(0); sss.mostrar();} // lo sube. Hemisferior Sur y paso de izquierda a derecha
   else if (sss.hemisferioEO() && (direccion%2==0)) { sss.mover(3); sss.mostrar();} // a la izquierda. Hemisferio este y paso de arriba a abajo
   else if (!(sss.hemisferioEO()) && (direccion%2==0)) { sss.mover(1); sss.mostrar();} // a la derecha. Hemisferio oeste, y paso de arriba a abajo.
}
direccion = sss.mover(direccion); // movimiento normal.

  // C) Muestro la serpiente
  sss.mostrar(); 
  
  // D) colisión con la cabeza de la serpiente
  if (sss.colisionCabezaFruta(unaFruta)) {
    // D1) aumento los puntos
    puntos +=1;
    // D2) aumento la longitud de la serpiente
    sss.alargar(2);
    // D3) Aumento la dificultad, aumentando la velocidad
    vel +=0.5;
    // D4) creo una nueva fruta
    // unaFruta = new Fruta (anchoCuadradito,sizeVentana, color(0,255,255)); // vuelvo a crear el objeto;
     while(sss.colisionZonaSnake(unaFruta.xx,unaFruta.yy)) {
        unaFruta = new Fruta (anchoCuadradito,sizeVentana, color(0,255,255)); // vuelvo a crear el objeto;
     }
  }
 
 /// E) Muestro información
 fill(255); // color del texto
 textSize(20);
 textAlign(LEFT,CENTER);
 text("Cuadrante: "+str(sss.cuadrante),20,sizeVentana+20);
 text("XX: "+str(sss.miSnake.get(0).x)+" // YY: "+str(sss.miSnake.get(0).y),20,sizeVentana+40); 
 text("Puntuación: "+str(puntos),20,sizeVentana+60);
 text("Longitud serpiente: "+str(sss.longitud),20,sizeVentana+80);
 
 // ============================================
 // Refresco del juego
 // ============================================
 // FIN A) Cambio la velocidad del frame
 frameRate(vel); // vel=1, un frame por segundo. Sumo 3, porque si no es muy lento.
}

//==========================
// Funciones
// =========================
// F1) obtiene la dirección en función de las teclas. 
int obtenerDireccion() {  
  if (keyPressed) {
    if (keyCode == UP) {
      direccion=0;
    } else if (keyCode == RIGHT) {
      direccion= 1;
    } else if (keyCode == DOWN) {
      direccion = 2;
    } else if (keyCode == LEFT) {
      direccion = 3;
    }
  }
  return direccion; // Si no se presiona ninguna tecla de dirección. Por defecto a la izquierda
}
