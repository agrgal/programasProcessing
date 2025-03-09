
int x=10;
int y=10;
int velx=3;
int vely=4;
int diametro=20;

void setup() {
 size (400,400);
 background(0);
 fill (255);
 }

void draw() {
 background (0);  
 ellipse (x,y,diametro,diametro);
 if (x<(diametro/2)) {velx=-velx;}
 if (y<(diametro/2)) {vely=-vely;}
 if (x>width-(diametro/2)) {velx=-velx;}
 if (y>height-(diametro/2)) {vely=-vely;}
 x=x+velx; y=y+vely;
 // saveFrame("pelotaReb_####.png");
}
