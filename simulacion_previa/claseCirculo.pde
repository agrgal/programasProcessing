class CirculoMovil {
  PVector posicion;
  PVector velocidad;
  float diametro;
  color col;
  float tiempoInfeccion;
  boolean estaInfectado;
  float tmax;
  int alturaVentanaEfectiva;
  
  CirculoMovil() {
    alturaVentanaEfectiva = 600;
    diametro = 10;
    posicion = new PVector(random(int(width-1-diametro/2)), random(int(alturaVentanaEfectiva-1-diametro/2)));
    velocidad = new PVector(random(-2, 2), random(-2, 2));
    col = color(0, 20, 0);  // Verde    
    tiempoInfeccion = 0;
    tmax =0;
    estaInfectado = false;
  }
  
  void mover() {
    
    
    // Añadir una pequeña aceleración aleatoria
    PVector aceleracion = PVector.random2D();
    aceleracion.mult(0.2);  // Reducir la magnitud de la aceleración para un movimiento más suave
    
    // Aplicar aceleración a la velocidad
    velocidad.add(aceleracion);
    
    // Limitar la velocidad máxima para evitar movimientos demasiado rápidos
    velocidad.limit(3);
    
    // Actualizar la posición
    posicion.add(velocidad);
    
    // Rebotar en los bordes
    if (posicion.x < int(1+diametro/2) || posicion.x > int(width-1-diametro/2)) velocidad.x *= -1;
    if (posicion.y < int(1+diametro/2) || posicion.y > int(alturaVentanaEfectiva-1-diametro/2)) velocidad.y *= -1;
    
    // Mantener dentro de los límites
    posicion.x = constrain(posicion.x, int(1+diametro/2) , int(width-1-diametro/2));
    posicion.y = constrain(posicion.y, int(1+diametro/2) , int(alturaVentanaEfectiva-1-diametro/2));
    
    // Actualizar tiempo de infección y cambiar color si es necesario
    if (estaInfectado) {
      tiempoInfeccion += 1/frameRate;
      if (tiempoInfeccion >= tmax) {
        curar();
      }
    }
    
    
  }
  
  void mostrar() {
    fill(col);
    noStroke();
    ellipse(posicion.x, posicion.y, diametro, diametro);
  }
  
  // colisiones
  boolean colision(CirculoMovil otro) {
    PVector distancia = PVector.sub(otro.posicion, posicion);
    float distanciaMin = (diametro + otro.diametro) / 2;
    
    if (distancia.mag() < distanciaMin) {
      // Calcular la nueva dirección
      distancia.normalize();
      
      // Aplicar el rebote
      PVector v = PVector.sub(velocidad, otro.velocidad);
      float dot = v.dot(distancia);
      distancia.mult(dot);
      
      velocidad.sub(distancia);
      otro.velocidad.add(distancia);
      
      // Comprobar si uno es rojo y el otro verde
      if (estaInfectado != otro.estaInfectado) {
        infectar();
        otro.infectar();
      }
      
      return true;
    }
    return false;
  }
  
  void infectar() {
    if (!estaInfectado) {
      col = color(255, 0, 0);  // Cambiar a rojo
      estaInfectado = true;
      tiempoInfeccion = 0;
    }
  }
  
  void curar() {
    if (estaInfectado) {
      col = color(0, 20, 0);  // Cambiar a verde
      estaInfectado = false;
      tiempoInfeccion = 0;
    }
  }
  
}
