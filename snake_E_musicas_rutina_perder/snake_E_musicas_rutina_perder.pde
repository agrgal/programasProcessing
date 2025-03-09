import ddf.minim.*;

// objetos de sonido
Minim minim;
AudioPlayer comerFrutaSound;
AudioPlayer gameOverSound;
AudioPlayer urban;

int sizeVentana;
int anchoCuadradito;
int longitudSnake;
float contar;

// Animando nuestra serpiente
float vel; // velocidad del juego
int direccion; // direccion inicial

// Dando puntuacion al juego
int puntos;

// Estado del juego
boolean juegoTerminado;

// Marco de la ventana: tamaño cuadro, color, tamaño de la ventana
// para que se vea bien , el tamaño del cuadro debe ser un submúltiplo del tamaño de la ventana
Marco miMarco;
Snake sss;
Fruta unaFruta; 

//==========================
// SETUP
// =========================
void setup() {
 size(40,40); // totalmente cuadrada. Cualquier valor
 minim = new Minim(this);
 comerFrutaSound = minim.loadFile("comer_fruta.wav");
 gameOverSound = minim.loadFile("game_over.mp3");
 urban = minim.loadFile("urban.mp3");
 reinicio();
}

//==========================
// DRAW
// =========================
void draw() { 
 
 background(0,0,50);
 // 0) Líneas de referencia
 /* stroke(255)
 line(sizeVentana/2,0,sizeVentana/2,sizeVentana);
 line(0,sizeVentana/2,sizeVentana,sizeVentana/2); */
 noStroke();
 
if (!juegoTerminado) {
 
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
    // D4) Sonido de comer
    comerFrutaSound.rewind(); comerFrutaSound.play();
    // D5) creo una nueva fruta
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
   text("Velocidad: "+str(vel),20,sizeVentana+60);
   text("Puntuación: "+str(puntos),width/2,sizeVentana+60);
   text("Longitud serpiente: "+str(sss.longitud),20,sizeVentana+80);
 
  // F) Detecta autocolision
  if (sss.autoColision() && !juegoTerminado) {
    juegoTerminado = true; // estado del juego cambia a terminado    
  }
  
} // Fin de si el juego no está terminado

else { // condicion de juego terminado
    // termina música de juego.
    urban.pause();
    // Música de gameOver
    gameOverSound.play();
    fill(255);
    textSize(30);
    textAlign(CENTER, CENTER);
    text("¡Juego terminado!", width/2, height/2);
    textSize(20);
    text("Puntuación total: "+str(puntos), width/2, height/2+40);
    text("Presiona 'S' para salir", width/2, height/2 + 80);
    text("Presiona 'R' para repetir", width/2, height/2 + 120);
    obtenerDireccion();
    if (direccion==1000) {
      urban.close(); gameOverSound.close(); comerFrutaSound.close(); // cerramos todos los ficheros de audio
      minim.stop(); super.stop(); 
      // ambas líneas detiene los recursos de la biblioteca minim, y de la aplicación en sí misma, liberando recursos.
      exit(); // cierra la aplicación
    }  else if (direccion==2000) {
      reinicio();
    }    
} // Fin de si termina el juego
 
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
    } else if(juegoTerminado && ((key == 's' || key == 'S'))) {
      direccion = 1000; 
    } else if(juegoTerminado && ((key == 'r' || key == 'R'))) {
      direccion = 2000; 
    }
  }
  return direccion; // Si no se presiona ninguna tecla de dirección. Por defecto a la izquierda
}

// F2) reinicio
void reinicio() {
 sizeVentana = 600; anchoCuadradito = 10; longitudSnake = 3; contar =0;
 vel = 4; direccion =0; puntos = 0; juegoTerminado = false;
 surface.setSize(sizeVentana,int(sizeVentana*1.2)); // redefinición del alto y ancho de la ventana. Margen para poner información
 // reinicio objetos
 miMarco = new Marco(anchoCuadradito,color(134),sizeVentana);
 sss = new Snake(longitudSnake,direccion,color(25,255,25),anchoCuadradito,sizeVentana);
 unaFruta = new Fruta (anchoCuadradito,sizeVentana, color(0,255,255)); // creando una fruta
 // Para que recalcule dónde mostrar la fruta, si está dentro de la zona de influencia de la serpiente creada
 while(sss.colisionZonaSnake(unaFruta.xx,unaFruta.yy)) {
    unaFruta = new Fruta (anchoCuadradito,sizeVentana, color(0,255,255)); // vuelvo a crear el objeto;
 }
 // Reproducción de sonido
 urban.rewind(); urban.loop();
}
