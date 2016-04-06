long currentTime;
long previousTime = 0;
long delta = 0;
float tx = 0;

Animation animation1 ;

Decor decor;
Player player;

float vitesse = 1;

void setup(){
  size(800,300);
  
  decor = new Decor(0,0,width,height);
  player = new Player(width/2,height);
  player.setLimits(0,width);
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
  player.updateFrame(delta); 
  player.update(this.vitesse,0);
  decor.update(-this.vitesse);
}

void display(){
  background(51, 173, 255);
  
  decor.displayBack();
  
  player.display(); 
  
  decor.displayFront();
  println(vitesse);

}


void keyPressed(){
  if(key == 'a'){
    this.vitesse = -3;
  }else if(key == 'd'){
    this.vitesse = 3;
  }else if(key == 's' ){
    this.vitesse =0;
  }
}