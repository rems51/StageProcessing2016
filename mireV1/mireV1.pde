import java.util.Random;

long currentTime;
long previousTime = 0;
long delta = 0;

Mire m = new Mire(50,50);

float tx = 0;
float ty = 10000;

void setup(){
  size(800,600); 
}

void draw(){
  noCursor();
  currentTime = millis();
  delta = currentTime - previousTime ;
  update(delta);
  display();
  previousTime = currentTime;
  
  
  float n = noise(tx);
  tx += 0.02;
  float x = map(n,0,1,-20,20);
  
   float ny = noise(ty);
   ty += 0.02;
   float y = map(ny,0,1,-20,20);
  
  background(255);
  
  
  m.update(pmouseX + (int)x  ,pmouseY+ (int)y);
  m.display();
}

void update(long delta){

}

void display(){

}
void mousePressed(){

  m.d = 100;

}

void mouseReleased(){
  m.d = 200;

}