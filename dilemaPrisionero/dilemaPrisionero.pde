// Teoría de juegos
// Si un jugador coopera contigo (1-1) ambos ganan 3 puntos
// Si ambos no cooperáis (0-0) cada uno gana 1 punto
// Si uno  no coopera, y el otro sí, el que no coopera gana 5 puntos y el otro nada. 

int turno = 0; // turno de juego
int ancho = 0;
ArrayList<Integer> primero; // primer jugador. Valor de 1, coopero. Valor 2, no coopero
ArrayList<Integer> segundo; // segundo jugador. O sea, yo. Idem
int[] puntos = {0, 0}; // puntos del primero y del segundo

void setup() {
 size(600,600);  
 primero = new ArrayList<Integer>(); // declaración del array List primero, vacío
 segundo = new ArrayList<Integer>(); // declaración del array List primero, vacío
 
 ancho = width-80;
}

 
void draw() {
 
  background(50);
  
  int fst = estrategiaPrimero(primero,segundo);
  int scd = estrategiaSegundo(primero,segundo);
  
  // turno primer jugador
  // primero.add(0);
  primero.add(fst);
  
  // ahora m iturno
  // segundo.add(1);
  segundo.add(scd);
  
  // imprimir resultado
  for (int i=0;i<=turno;i++) {
    fill(255*int(primero.get(i)==0),255*int(primero.get(i)==1),0);
    ellipse( 40 + (i*10) % ancho, 30+int((i*10)/ancho)*20  ,10,10);
    fill(255*int(segundo.get(i)==0),255*int(segundo.get(i)==1),0);
    ellipse( 40 + (i*10) % ancho, 40+int((i*10)/ancho)*20  ,10,10);
  }
  
  // puntuación
  if (primero.get(turno)==1 && segundo.get(turno)==1) { // ambos cooperan
    puntos[0] += 3; puntos[1] += 3;  
  } else if (primero.get(turno)==0 && segundo.get(turno)==0) { // ambos no cooperan
    puntos[0] += 1; puntos[1] += 1; 
  } else if (primero.get(turno)==0 && segundo.get(turno)==1) { // primero no coopera. Gana 5 puntos. 
    puntos[0] +=5;
  } else if (primero.get(turno)==1 && segundo.get(turno)==0) { // segundo no coopera. Gana 5 puntos
    puntos[1] +=5;
  }
  
  textSize(20);
  fill(255);
  text("Turno:     " + (turno+1), 10, height - 70);
  text("Jugador PRIMERO: " + puntos[0], 10, height - 50);
  text("Jugador SEGUNDO: " + puntos[1], 10, height - 30);
  
  turno +=1;
  
  if (turno>=200) { 
    printArray(primero);
    printArray(segundo);
    noLoop();
   }   
   
  frameRate(50); // por segundo
}


// Estrategia del primer jugador 
int estrategiaPrimero(ArrayList<Integer> first, ArrayList<Integer> second) {
  // return aleatoria(second, first);
  return dondeLasDanLasToman(second, first); // primero mi enemigo, después yo
  // return yaNoEresMiAmigo(second,first);
  // return meGustaGanarDeVezEnCuando(second, first);
}

// Estrategia del segundo jugador 
int estrategiaSegundo(ArrayList<Integer> first, ArrayList<Integer> second) {
  // return aleatoria(first,second);  
  // return dondeLasDanLasToman(first,second); // primero mi enemigo, después yo
  // return yaNoEresMiAmigo(first,second);
  return meGustaGanarDeVezEnCuando(first,second);
}

///********************************************************************************** /

// Estrategias
// A) ¿Que antes no cooperaste? Ahora yo no coopero
int dondeLasDanLasToman(ArrayList<Integer> enemigo, ArrayList<Integer> yo) {
  int num = 0;
  if (yo.size()==0 && enemigo.size()>=0) {
    num = 1; // en la primera tirada, coopera
  } else {
    // Si en la tirada anterior, el primero no cooperó el no coopera. 
    num = enemigo.get(yo.size()-1); // el hace lo que hizo el primero en la anterior tirada
  } 
  return num;
}

// B) Dejaste de ser mi amigo
int yaNoEresMiAmigo(ArrayList<Integer> enemigo, ArrayList<Integer> yo) {
  int num = 1;
  if (yo.size()==0 && enemigo.size()>=0) {
    num = 1; // en la primera tirada, coopera
  } else {
    for (int cada:enemigo) {
        num *= cada; // si cada es cero una vez, ya num siempre será cero.  
    }
  } 
  return num;
}

// C) A mí me gusta ganar de vez en cuando
int meGustaGanarDeVezEnCuando(ArrayList<Integer> enemigo, ArrayList<Integer> yo) {
  int num = 1;
  int tam = yo.size();
  if (yo.size()==0 && enemigo.size()>=0) {
    num = 1; // en la primera tirada, coopero
  } else {
    if (tam>4) {
      if (yo.get(tam-1)==1 && yo.get(tam-2)==1 && yo.get(tam-3)==1) { num=0; } else {num=1;} 
    } else {
      num=1; 
    }
  } 
  return num;
}

// 0) Aleatoria
int aleatoria(ArrayList<Integer> enemigo, ArrayList<Integer> yo) {
  // quien =1, el primero ; quien = 2 el segundo.
  // Esta estrategia es aleatoria salvo en la tirada inicial, que es cero. No cooperar.  
  int num = 0;
  if (enemigo.size()>=0 && yo.size()==0) {
    num = 0; 
  } else {
    num = int(random(1,100))%2; 
  } 
  return num;  
}
