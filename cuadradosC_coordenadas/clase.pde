class Cuadrado {
 
  float x, y, tm,i,j;
  color c;
  
  Cuadrado(float x, float y, float tm, color c, float i, float j) {
    this.x = x;
    this.y = y;
    this.tm = tm;
    this.c = c;
    this.i = i;
    this.j=j;
  }
  
  void mostrar() {
    pushMatrix();
    translate(x,y);
    rectMode(CENTER); // centro del dibujo.
    fill(c);
    square(0,0,tm); // en el punto x,y 
    popMatrix();
  }
  
  void punto() {
    pushMatrix();
    translate(x,y);
    fill(255,0,0);
    ellipse(0,0,10,10);
    popMatrix();
  }
  
  void coordenada() {
    float xx,yy;
    pushMatrix();
    xx = ((x-centroX)/tm)*1.1*tm+centroX-15;
    yy = ((y-centroY)/tm)*1.1*tm+centroY;
    color cxy = get(int(xx),int(yy));
    cxy = color (255-red(cxy),255-green(cxy),255-blue(cxy));
    translate(xx,yy);
    fill(cxy);
    rectMode(CORNER);
    text("("+str(int((x-centroX)/tm))+","+str(int((y-centroY)/tm))+")",0,0);
    popMatrix();
  }
  
}
