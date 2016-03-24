long currentTime;
long previousTime = 0;
long delta = 0;
int vitesse = 3;
int vitesseX = vitesse;
int vitesseY = vitesse;
int h = 100 ;
int w = 100 ;
int x = w + 1;
int y = h + 1;


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
  x += vitesseX ;
  if(x+w/2 >= width || x-w/2 <= 0){
    vitesseX *= -1;
  }
    y += vitesseY ;
  if(y+ h /2 >= height || y-h/2 <= 0){
    vitesseY *= -1;
  }
}

void display(){
  background(0);
  ellipse(x,y,w,h);
  stroke(0);
  point(x,y);
}