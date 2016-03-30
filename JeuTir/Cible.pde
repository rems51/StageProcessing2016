class Cible extends ObjetGraphique{

  PImage cible ;
  
  int diametreMax = min(height,width);
  
  int imgW;
  int imgH;
  
  int vitesse;
  
  ConteneurImpacts impacts = new ConteneurImpacts();
  
  boolean kidCible = false;
  
  int zCible;
  
  Cible (int x, int y, int z, int vitesseCible) {
    super(x,y);
    cible = loadImage("cible_mouvante.png");
    imgW = diametreMax/z;
    imgH = imgW;
    cible.resize(imgW,imgH);
    vitesse = vitesseCible; 
    zCible = z;
  }
  
  void update() {
    if(this.position.x - imgW/2 >= width ){
      this.position.x = - imgW/2;
    }else if( this.position.x + imgW/2 < 0 ){
      this.position.x = width + imgW/2 ;
    }
    if(this.position.y - imgH/2 >= height ){
      this.position.y =  - imgH/2;
    }else if(this.position.y + imgH/2 < 0 ){
      this.position.y = height + imgH/2;
    }
    this.position.x += vitesse;
  }
  
  void display() {
    
    pushMatrix();
    translate (position.x, position.y);
    
    image(cible,-imgW/2,-imgH/2);
    
    impacts.display();
    
    popMatrix();
  }
  
  boolean isTouched(float x,float y){
    
    float d = (x - this.position.x)*(x - this.position.x) + (y - this.position.y)*(y - this.position.y);
    
    //if(x > this.position.x - imgW/2 && x < this.position.x + imgW/2 && y > this.position.y - imgH/2 && y < this.position.y + imgH/2){
    if(d > imgW/2 * imgH/2){
      println("pas Touché !");
      return false;
    }else{
      println("Touché !");
      return true;
    }
  }
  
  void ajoutImpact(float x,float y){
    impacts.ajoutImpact(x - this.position.x, y - this.position.y,zCible);
    impacts.setKidmode(kidCible);
  }
  
  void cleanAllImpact(){
    impacts.cleanAllImpact();
  }
  
  void setKidmode(boolean kidmode){
    if(kidmode){
      kidCible = true;
      cible = loadImage("cible_kid.png");
      cible.resize(imgW,imgH);
    }else if(!kidmode){
      kidCible = false;
      cible = loadImage("cible_mouvante.png");
      cible.resize(imgW,imgH);
    }
    impacts.setKidmode(kidmode);
  }
  
}