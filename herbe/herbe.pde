long currentTime;
long previousTime = 0;
long delta = 0;
float tx = 0;
Grass grass;
Clouds nuages;
int anim = 0;
Animation animation1 ;
ObjetGraphique background ;
Background b ;

void setup(){
  size(800,300);
  grass =new Grass(width,height,0,0);
  this.nuages = new Clouds(width,height,50,0,0);
  frameRate(24);
  animation1 = new Animation("sprite_","png", 6);
  animation1.updatePos(width/2-animation1.getWidth()/2,height-animation1.getHeigth());
  background = new ObjetGraphique("background0000.png");
  background.update(0.70);
  b = new Background("background0000.png",false,0,-100,width,height);
  b.resize(0.70);
}


void draw(){
  currentTime = millis();
  delta = currentTime - previousTime ;
  update(delta);
  display();
  previousTime = currentTime;
}

void update(long delta){
  anim += delta;
  animation1.updateFrame(delta);
  background.update(0,-100);
  b.update(-1);
}

void display(){
  background(51, 173, 255);
  nuages.display(-0.5,0); 
  b.display();
  animation1.display(); 
  grass.display(-3,0);
}