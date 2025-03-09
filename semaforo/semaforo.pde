char tecla = ' ';  // Variable para almacenar la tecla presionada

void setup() {
  size(200, 400);  // Tamaño de la ventana
}

void draw() {
  background(255);  // Fondo blanco
  
  // Dibujar la estructura del semáforo
  fill(50);
  rect(50, 50, 100, 300);  // El cuerpo del semáforo
  
  // Condicionales para cambiar el color del semáforo
  if (tecla == 'r') {
    // Luz roja
    fill(255, 0, 0);
    ellipse(100, 100, 80, 80);
    
    fill(50);
    ellipse(100, 200, 80, 80);  // Apagar amarillo
    ellipse(100, 300, 80, 80);  // Apagar verde
    
  } else if (tecla == 'a') {
    // Luz amarilla
    fill(255, 255, 0);
    ellipse(100, 200, 80, 80);
    
    fill(50);
    ellipse(100, 100, 80, 80);  // Apagar rojo
    ellipse(100, 300, 80, 80);  // Apagar verde
    
  } else if (tecla == 'v') {
    // Luz verde
    fill(0, 255, 0);
    ellipse(100, 300, 80, 80);
    
    fill(50);
    ellipse(100, 100, 80, 80);  // Apagar rojo
    ellipse(100, 200, 80, 80);  // Apagar amarillo
  }
}

void keyPressed() {
  // Capturar la tecla presionada y asignarla a la variable
  tecla = key;
}
