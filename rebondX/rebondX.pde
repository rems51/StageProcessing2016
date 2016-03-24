long currentTime;
long previousTime = 0;
long delta = 0;
int vitesse = 3;
int x = 101;
int h = 100 ;
int w = 100 ;


void setup(){
  size(800,600);
}


void draw(){
  currentTime = millis();
  delta = currentTime - previousTime ;
  update(delta);
  display();
  previousTime = currentTime;
}

void update(long delta){
  x += vitesse ;
  if(x+w/2 >= width || x-w/2 <= 0){
    vitesse *= -1;
  }
}

void display(){
  background(0);
  ellipse(x,100,w,h);
  stroke(0);
  point(x,100);
}