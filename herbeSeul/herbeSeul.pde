// la touche 'a' permet d,accelerer vers la gauche, 'd' vers la droite et 's' permet de ralentir.

long currentTime;
long previousTime = 0;
long delta = 0;
float tx = 0;


Grass grass;

float vitesse = 1;
float acceleration = 1;
int limitSpeed = 100;

void setup(){
  size(800,300);
  this.grass =new Grass(width,height,0,0);
}


void draw(){
  currentTime = millis();
  delta = currentTime - previousTime ;
  update(delta);
  display();
  previousTime = currentTime;
}

void update(long delta){

}

void display(){
  background(51, 173, 255); 
  grass.display(this.vitesse,0);
  println("vitesse : "+ vitesse);

}