import javax.swing.JOptionPane; // clase de java que permite abrir una ventana panel.

// ======================================================
// Variables globales
//=======================================================
int tamanno, individuos, infectados;
float tiempo;
int tiempofdeSimulacion;
int contadorInfecciones = -1;
ArrayList<CirculoMovil> circulos;
boolean simulacionTerminada = false;
long tiempoInicio = 0;
float tiempoParcial = 0.0;
int muertos = 0;
int defensas = 0;
boolean colision;

PrintWriter output; // clase que escribe datos en un fichero
boolean fileExists; // Si existe el fichero.
ArrayList<String> datos; // crea un lista con datos
boolean modoAutomatico = true;

// ======================================================
// Función SETUP. Condiciones iniciales.
//=======================================================
void setup() {
  size(600, 800);  
  datos = new ArrayList<String>(); // empieza con la lista de datos
  
  // ördenes de la clase Java que permite abrir un panel de diálogo
  int opcion = JOptionPane.showConfirmDialog(null, "¿Desea ejecutar en modo automático?", "Selección de Modo", JOptionPane.YES_NO_OPTION);
  modoAutomatico = (opcion == JOptionPane.YES_OPTION); // establece modo automático o no.
  
  iniciarSimulacion(); // datos iniciales de la simulación 
}

// ======================================================
// Función de inicio de simulación
//=======================================================
void iniciarSimulacion() {
  tiempoInicio = millis(); // cuenta de tiempo
  tamanno = int(random(8,20)); // tamaño de los individuos
  individuos = int(random(30,1000)); // Número de individuos
  infectados = int(random(1,5)); // infectados Inicialmente
  defensas = int(random(6,10)); // defensas del cuerpo
  tiempo = int(random(3,7)); // tiempo de curación
  tiempofdeSimulacion = int(random(int(tiempo),10*int(tiempo))); // tiempo máximo de la simulación
  contadorInfecciones = -1;
  muertos=0;
  simulacionTerminada = false;  
  
  circulos = new ArrayList<CirculoMovil>();
  
  for (int i = 0; i < individuos; i++) {
    CirculoMovil c = new CirculoMovil();
    c.diametro = tamanno;
    c.tmax = tiempo;
    if (i < infectados) {c.infectar(); }
    if (infectados <= i && i < infectados+defensas) { c.col=color(255,255,0); c.diametro=tamanno*random(1,2);}
    circulos.add(c);    
  }
}

// ======================================================
// Bucle principal 
//=======================================================
void draw() {
  
  if (!simulacionTerminada && (tiempofdeSimulacion > (millis()-tiempoInicio)/1000)) {
    background(200);
    stroke(0);
    line(0, 600, 600, 600); // línea divisoria
    
    // Destruye los que se hayan infectado más de tres veces
    for (int i=0;i<circulos.size();i++) {
       if (circulos.get(i).vecesInfectado>=3 || circulos.get(i).vecesInfectado==-1) {
         circulos.remove(i);
         muertos +=1;
       }
    }
    
    // Los individuos creados los mueve y los muestra. También cuenta los infectados.
    for (CirculoMovil c : circulos) {
      c.mover();
      c.mostrar();
    }
    
    // Detectando colisiones
    for (int i = 0; i < circulos.size(); i++) {
      for (int j = i + 1; j < circulos.size(); j++) {
        colision = circulos.get(i).colision(circulos.get(j));
        if (colision) { contadorInfecciones +=1;} 
      }
    }
   
    mostrarInformacion();
        
  } else {    
    simulacionTerminada = true;
    mostrarFinSimulacion();
  }
}

// ======================================================
// Muestra información en pantalla
//=======================================================
void mostrarInformacion() {
  fill(0);
  textSize(20);
  textAlign(LEFT, CENTER);
  text("Infecciones: " + contadorInfecciones, 20, 620);
  text("Número de ind. sanos: " + circulos.size(), 20, 640);
  tiempoParcial = parseFloat(int(millis()-tiempoInicio))/1000;
  text("Número de defensas: "+defensas , 20, 660);    
  text("Tiempo: " + tiempoParcial + " s de " + tiempofdeSimulacion +" s" , 20, 680);
  
  text(individuos + " individuos de " + tamanno + " de tamaño", width/2, 620);
  text("Inicialmente inf.: " + infectados+ " Muertos: "+muertos, width/2, 640);
  text("tiempo de curación: " + tiempo, width/2, 660);
}

// ======================================================
// Mostrar en pantalla y acciones al acabar la simulación 
//=======================================================
void mostrarFinSimulacion() {
  fill(200);
  rect(0,701,width,height);
  fill(0);
  textSize(20);
  textAlign(CENTER, CENTER);
  text("FIN DE LA SIMULACION en "+ tiempoParcial+  " s.", width/2, 720);  
  text("Presiona 'r' para reiniciar, 'x' para terminar", width/2, 750); 
  
  // escribir Datos y seguir/cerrar
  if (!modoAutomatico) {
    obtenerLetra();
  } else { // Si no es automático, va escribiendo y creando el fichero constantemente, y empezando una nueva simulación
    escribeDato();
    escribeFichero();
    datos = new ArrayList<String>(); // IMPORTANTE: poner ésto a cero...
    iniciarSimulacion(); 
  }
  
}

// =============================================
// Escribe un dato tipo cadena en la Lista datos 
//==============================================
void escribeDato() {
  String datoActual = fh()+","+individuos +","+infectados+","+muertos+","+defensas+","+contadorInfecciones+","+tiempofdeSimulacion+","+tiempo+","+tamanno;          
  datos.add(datoActual);
  // println(datos); 
}

// Devuelve fecha y hora actual
String fh() {
  int y = year();
  int m = month();
  int d = day();
  String hora = nf(hour(), 2) + ":" + nf(minute(), 2) + ":" + nf(second(), 2);
  String fechaHora = nf(d,2) + "/" + nf(m,2) + "/" + nf(y,4) + " " + hora;
  return fechaHora;
}

// =============================================
// Escribe un fichero llamado datos.csv
// Contiene los datos de todas las simulaciones.
//==============================================
void escribeFichero() {
      File f = new File(sketchPath("datos.csv"));
      if (f.exists()) {
        // Si el archivo existe, leer su contenido
        String[] lines = loadStrings("datos.csv");
        for (int i = lines.length - 1; i >= 0; i--) {
          String line = lines[i];
          // println(line);
          datos.add(0, line); // Añadir al principio de la lista
        }
        f.delete(); // Borrar el archivo existente
      } else { // si no existe, empieza por una cabecera
          String cabecera = "timestamp,individuos, infectadosInicial,muertos,defensas, numeroInfecciones,tiempoFin,tiempoCuracion,tamanno";    
          datos.add(0,cabecera); // añade la cabecera al principio de la cola. 
      }
      // println(datos);      
      // Crear o recrear el archivo con todos los datos
      PrintWriter output = createWriter("datos.csv");
      for (String dato : datos) {
        output.println(dato);
      }
      output.flush();
      output.close();
}

// =============================================
// Función que comprueba si se pulsa r o x
//==============================================
void obtenerLetra() {
  if (keyPressed) {
    if (key == 'r' || key == 'R') {
        // Escribe en la variable datos
        escribeDato();
        iniciarSimulacion();       
        // println("simul: " + simulacionTerminada+ " // tiempoInicio = " + tiempoInicio); 
    }
    if (key == 'x' || key == 'X') {
        // Escribe en la variable datos
        escribeDato();
        escribeFichero();
        exit();
    }          
  } 
}
