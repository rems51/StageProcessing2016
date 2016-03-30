class Impact extends ObjetGraphique{
  
  boolean kidImpact = false;
  
  PImage impact ;
  
  int imgW = 60;
  int imgH = imgW;
  
  int diametreImpact = 30;
  
  Impact (int z) {
    super();
    diametreImpact = diametreImpact / z ;
    imgW = imgW / z;
    imgH = imgW;
    impact = loadImage("fleur.png");
    impact.resize(imgW,imgH);
  }
  
  void update() {
    
  }
  
  void display() {
    
    pushMatrix();
    translate (position.x, position.y);
    if(!kidImpact){
      fill(0);
      stroke(150);
      ellipse (0, 0, diametreImpact, diametreImpact);
    }else if(kidImpact){
      image(impact,-imgW/2,-imgH/2);
    }
    popMatrix();
  }
  
  void setKidmode(boolean kidmode){
      kidImpact = kidmode;
  }
  
  float getX(){
    return this.position.x;
  }
  
  float getY(){
    return this.position.y;
  }
  
  void setX(float x){
    this.position.x = x;
  }
  
  void setY(float y){
    this.position.y = y;
  }
  
}