long currentTime;
long previousTime = 0;
long delta = 0;
float tx = 0;
Blade b;

void setup(){
  size(800,600);
  b = new Blade(new PVector(200,600));
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
  background(255);
  float n = noise(tx);
  tx += 0.01;
  float x = map(n,0,1,-50,50);
  b.display(x);
  
}