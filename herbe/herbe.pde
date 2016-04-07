// la touche 'a' permet d,accelerer vers la gauche, 'd' vers la droite et 's' permet de ralentir.

long currentTime;
long previousTime = 0;
long delta = 0;
float tx = 0;

Animation animation1 ;

Decor decor;
Player player;

float vitesse = 1;
float acceleration = 1;
int limitSpeed = 100;

void setup(){
  size(800,300);
  
  decor = new Decor(0,0,width,height);
  player = new Player(width/2,height);
  player.setLimits(width/2-1,width/2+1);
  frameRate(24);


}


void draw(){
  currentTime = millis();
  delta = currentTime - previousTime ;
  update(delta);
  display();
  previousTime = currentTime;
}

void update(long delta){
  if(keyPressed && key == 'a'){
    this.vitesse -= acceleration;
  }else if(keyPressed && key == 'd'){
    this.vitesse += acceleration;
  }else if(keyPressed && key == 's' ){
    this.vitesse = (int)(0.99 * this.vitesse);
  }
  
  
  checkLimitSpeed();
  player.updateFrame(delta); 
  player.update(this.vitesse,0);
  decor.update(-this.vitesse);
}

void display(){
  background(51, 173, 255); 
  decor.displayBack(); 
  player.display(); 
  decor.displayFront();
  println("vitesse : "+ vitesse);

}

void checkLimitSpeed(){
  if(this.vitesse > limitSpeed){
    this.vitesse = limitSpeed;
  }else if(this.vitesse <-limitSpeed){
    this.vitesse = -limitSpeed;
  }
}