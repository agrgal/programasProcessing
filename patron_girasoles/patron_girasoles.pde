float goldenRatio = (1 + sqrt(5)) / 2;

void setup() {
  size(800, 800);
  background(0);
  colorMode(HSB, 360, 100, 100);
}

void draw() {
  translate(width/2, height/2);
  
  for (int i = 0; i < 1000; i++) {
    float angle = i * goldenRatio * TWO_PI;
    float radius = sqrt(i) * 10;
    float x = cos(angle) * radius;
    float y = sin(angle) * radius;
    
    fill(i % 360, 100, 100);
    ellipse(x, y, 5, 5);
  }
  
  noLoop();
}
