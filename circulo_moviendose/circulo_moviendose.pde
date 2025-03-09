float x, y;
color circleColor;

void setup() {
  size(400, 400);
  x = width / 2;
  y = height / 2;
  circleColor = color(255);
  noCursor(); // Oculta el cursor para una mejor experiencia visual
}

void draw() {
  background(200);
  
  // Actualizar la posición del círculo con la posición del ratón
  x = mouseX;
  y = mouseY;
  
  // Dibujar el círculo
  fill(circleColor);
  ellipse(x, y, 50, 50);
}

void keyPressed() {
  if (key == ENTER || key == RETURN) {
    // Cambiar color al presionar INTRO
    circleColor = color(random(255), random(255), random(255));
  }
}
