void setup() {
  size(400, 400);
  background(255);
  
  // Dibujar un círculo con transformación
  pushMatrix();
  translate(200, 200);
  rotate(PI / 4);
  rect(0,0,100,80);
  popMatrix();
}
