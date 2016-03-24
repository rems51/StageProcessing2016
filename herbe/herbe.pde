long currentTime;
long previousTime = 0;
long delta = 0;
float tx = 0;

ArrayList<Blade> grass;

void setup(){
  size(800,600);
  grass =new ArrayList<Blade>(10);
  for(int i = 0; i < 400;i++){
    grass.add(new Blade(new PVector(i*2,600)));
  }
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
  tx += 0.01; 
  for(int j = 0; j< grass.size(); j++){
    float n = noise(tx+j/2);
    float x = map(n,0,1,-100,100);
   
    grass.get(j).display(x);
  }
  
}