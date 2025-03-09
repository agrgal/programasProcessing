void setup() {
  size(400, 400);
  background(255);
  noLoop();
}
 
void draw() {
  for (int i = 0; i < 100; i++) {
    float x = random(width);
    float y = random(height);
    float size = random(10, 50);
    ellipse(x, y, size, size);  // Círculos generados de forma aleatoria
  }
}
