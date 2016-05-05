long currentTime;
long previousTime = 0;
long delta = 0;
float tx = 0;

 boolean mouseisclicked = false;

//GrassLine grass;

ArrayList<GrassLine> mnt = new ArrayList();

void setup(){
  size(800,600);
  //this.grass =new GrassLine(new PVector(10,100),new PVector(600,250));
}


void draw(){
  currentTime = millis();
  delta = currentTime - previousTime ;
  update(delta);
  display();
  previousTime = currentTime;
}

void update(long delta){
  if(mouseisclicked){
    this.mnt.add(new GrassLine(new PVector(pmouseX,pmouseY),new PVector(mouseX,mouseY)));
  }
  //println(mnt.size());
  if(mnt.size() > 100){
    mnt.remove(0);
  }
}

void display(){
  background(51, 173, 255); 
  //grass.display(0,0);
  for(GrassLine morc : this.mnt){
    morc.display(0,0);
  }

}

void mousePressed(){
   mouseisclicked = true;   
}
  
void mouseReleased(){
  mouseisclicked = false;
}