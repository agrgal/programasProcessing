import processing.video.*;

Movie video;
ArrayList<PImage> frames;
int currentFrame = 0;
boolean recording = false;

void setup() {
  size(640, 360);
  video = new Movie(this, "robot.mp4");
  video.loop();
  frames = new ArrayList<PImage>();
}

void draw() {
  if (video.available()) {
    video.read();
    image(video, 0, 0);
    
    if (recording) {
      // Capturar fotograma actual
      PImage frame = video.get();
      frames.add(frame);
      
      // Indicador visual de grabación
      fill(255, 0, 0);
      ellipse(width - 20, 20, 10, 10);
    }
    
    // Mostrar número de fotogramas capturados
    fill(255);
    text("Frames: " + frames.size(), 10, 20);
  }
}

void keyPressed() {
  if (key == 'r' || key == 'R') {
    // Iniciar/detener grabación
    recording = !recording;
    if (!recording) {
      println("Grabación finalizada. Frames capturados: " + frames.size());
    }
  } else if (key == 's' || key == 'S') {
    // Guardar fotogramas como imágenes individuales
    for (int i = 0; i < frames.size(); i++) {
      frames.get(i).save("frame_" + nf(i, 4) + ".png");
    }
    println("Fotogramas guardados como imágenes PNG.");
  }
}
