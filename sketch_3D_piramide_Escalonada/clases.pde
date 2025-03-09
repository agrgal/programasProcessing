class Cubo {
  float x, y, z, l; // posición x, y, z y longitud
  color c; // color del cubo
 
  Cubo(float px, float py, float pz, float size, color col) {
    this.x = px;
    this.y = py;
    this.z = pz;
    this.l = size;
    this.c = col;
  }
  
  void mostrar() {
    pushMatrix();
    translate(x, y, z);
    // fill(c,150);
    strokeWeight(4);
    stroke(c);
    noFill();
    box(l);  
    popMatrix();   
  }
  
  void esfera() {
    pushMatrix();
    translate(x, y, z);
    fill(255,0,0);
    noStroke();
    sphere(10);
    popMatrix();   
  }
}
