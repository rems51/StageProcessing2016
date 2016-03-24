Face[] visages;

void setup() {
  size (640, 480); 
  
  visages = new Face[25];
  
  for (int i = 0; i < 25; i++)  {
    visages[i] = new Face();
    visages[i].position.x = random(0, width);
    visages[i].position.y = random (0, height);
  }
}

void draw () {
  background (0);
  
  for (int i = 0; i < 25; i++)  {
  
    visages[i].update();
    visages[i].display();
  }
}