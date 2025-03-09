int tamanno = int(random(8,12)); // tamaño de los individuos. Aleatorio entre 8 y 12
int individuos = int(random(30,100)); // número de individuos en total
int infectados = int(random(1,5)); // inicialmente, el número de infectados
float tiempo = int(random(3,10)); // tiempo en el que se curan en segundos
int tiempofdeSimulacion = int(random(int(tiempo),int(tiempo*(random(1,3))))); // en segundos
int contadorInfectados = -1; // debe ser un valor distinto de cero. 
ArrayList<CirculoMovil> circulos;

void setup() {
  size(600, 800);
  circulos = new ArrayList<CirculoMovil>();
  
  // Crear círculos infectados (azules)
  for (int i = 0; i < individuos; i++) {
    CirculoMovil c = new CirculoMovil();
    c.diametro = tamanno;
    c.tmax=tiempo;
    if (i < infectados) {c.infectar(); }
    circulos.add(c);    
  }
}

void draw() {
  
  if (tiempofdeSimulacion>millis()/1000 && contadorInfectados!=0) { // Corta si se alcanza el tiempo de simulación o no hay infectados.
    
    background(200);  // Gris claro
    
    // Dibujar línea separadora
    stroke(0);
    line(0, 600, 600, 600);
    
    
    for (CirculoMovil c : circulos) {
      c.mover();
      c.mostrar();
    }
    
    // Detectar y resolver colisiones
    for (int i = 0; i < circulos.size(); i++) {
      for (int j = i + 1; j < circulos.size(); j++) {
        circulos.get(i).colision(circulos.get(j));
      }
    }
    
    // Contar y mostrar el número de infectados
    contadorInfectados = 0;
    for (CirculoMovil c : circulos) {
      if (c.estaInfectado) {
        contadorInfectados++;
      }
    }
    
    // Mostrar texto en el área inferior
    fill(0);
    textSize(20);
    textAlign(LEFT, CENTER);
    text("Número de infectados: " + contadorInfectados, 20, 620);
    text("Número de personas sanas: " + (individuos-contadorInfectados), 20, 640);
    text("Tiempo: " + (float(millis())/1000) + " s de " +tiempofdeSimulacion +" s" , 20, 660);    
    text(individuos + " individuos de " + tamanno + " de tamaño",width/2,620);
    text("Inicialmente infectados: "+infectados, width/2,640);
    text("tiempo de curación: "+tiempo,width/2,660);
    
  } // fin del if 
  
  else { // si no, escribe además FIN DE SIMULACIÖN EN ___ S
    textAlign(CENTER, CENTER);
    text("FIN DE LA SIMULACION A LOS " + float(millis())/1000+ " s", width/2, 700);   
    stop();
  }  
}
