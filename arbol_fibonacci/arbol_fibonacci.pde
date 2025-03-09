int[] fib = new int[20];

void setup() {
  size(800, 600);
  background(255);
  stroke(0);
  
  fib[0] = 0;
  fib[1] = 1;
  for (int i = 2; i < 20; i++) {
    fib[i] = fib[i-1] + fib[i-2];
  }
  
  translate(width/2, height);
  branch(12);
}

void branch(int n) {
  if (n > 1) {
    line(0, 0, 0, -fib[n]*1);
    translate(0, -fib[n]*1);
    
    pushMatrix();
    rotate(PI/4);
    branch(n-1);
    popMatrix();
    
    pushMatrix();
    rotate(-PI/4);
    branch(n-2);
    popMatrix();
  }
}
