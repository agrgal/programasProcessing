ArrayList<Cubo> piramide;
float angulo = 0;

void setup() {
  size(800, 600, P3D);
  piramide = new ArrayList<Cubo>();
  
  // Crear la pirámide
  int niveles = 3;
  float tamanoCubo = 80;
  color baseColor = color(255, 255, 0);
  
 for (int y = 0; y < niveles; y++) { // Desde el nivel más bajo hasta el más alto
    for (int x = 0; x < niveles - y; x++) { // Reducir el número de cubos por nivel
      for (int z = 0; z < niveles - y; z++) {
        float px = x * tamanoCubo - (niveles - y - 1) * tamanoCubo / 2;
        float py = (niveles - y - 1) * tamanoCubo; // Ajustar la posición vertical hacia abajo
        float pz = z * tamanoCubo - (niveles - y - 1) * tamanoCubo / 2;
        color c = lerpColor(baseColor, color(255), float(y) / niveles); // Gradiente de color
        piramide.add(new Cubo(px, py, pz, tamanoCubo, c));
      }
    }
 }

}

void draw() {
  background(200);
  lights();
  
  translate(width/2, height/2);
  rotateX(radians(-35.264));
  rotateY(radians(-45 + angulo));
  
  for (Cubo cubo : piramide) {
    cubo.mostrar();    
    cubo.esfera();
  }
  
  angulo += 0.5; // Rotación continua
}
