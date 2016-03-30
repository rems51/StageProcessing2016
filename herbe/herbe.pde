long currentTime;
long previousTime = 0;
long delta = 0;
float tx = 0;

ArrayList<Blade> grass;

int anim = 0;

Animation animation1 ;

void setup(){
  
  size(800,300);
  
  grass =new ArrayList<Blade>(10);
  for(int i = -50; i < width+50;i++){
    grass.add(new Blade(new PVector(i,height)));
  }
  frameRate(24);
  animation1 = new Animation("sprite_","png", 6);
}


void draw(){
  currentTime = millis();
  delta = currentTime - previousTime ;
  update(delta);
  display();
  previousTime = currentTime;
}

void update(long delta){
  tx += 0.01;
  anim += delta;
  animation1.updateFrame(delta);
}

void display(){
  background(51, 173, 255);
  
  animation1.display(width/2-animation1.getWidth()/2,height-animation1.getHeigth());
  
  //update et desine tout les brins d'herbe
  for(int j = 0; j< grass.size(); j++){
    float n = noise(tx+j/2);
    float x = map(n,0,1,-100,100);
    grass.get(j).ancre.x -= 2;
    if(grass.get(j).ancre.x < -50){grass.get(j).ancre.x += width +100;}
    grass.get(j).updateDetailLevel(2);
    grass.get(j).display(x);
  }
  
  
  
}