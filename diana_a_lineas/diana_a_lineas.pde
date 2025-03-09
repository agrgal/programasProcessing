
int cx = 0;
int cy = 0;
int d = 280;
float angulo = 45.0;

void setup() {
 size(600,600);
 cx = width/2;
 cy = height/2;
}

void draw() {
  background(200);
  strokeWeight(2);
  
  for(angulo=0.0;angulo<360;angulo=angulo+0.1) {
    for (d=280;d>=40;d=d-40) {
      stroke(255,255-(d%80)*255,255-(d%80)*255);
      line(cx+(d-40)*cos(radians(angulo)),cy-(d-40)*sin(radians(angulo)),cx+d*cos(radians(angulo)),cy-d*sin(radians(angulo)));
    }
  }
}
