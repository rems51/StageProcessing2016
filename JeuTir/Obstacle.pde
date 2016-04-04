class Obstacle extends ObjetGraphique{

  PImage obstacle ;
  PImage obstacleKid;
  
  ConteneurImpacts impacts = new ConteneurImpacts();
  
  int tailleImpact;

  int imgW;
  int imgH;
  
  int vitesseX = 0;
  int vitesseY = 0;
  
  boolean kidObstacle = false;
  
  Obstacle (PImage img, int x, int y, int widthImg, int heightImg,int tailleImpacts, int vitesseObstacleX, int vitesseObstacleY) {
    super(x,y);
    obstacle = img.copy();
    obstacleKid = img.copy();
    imgW = widthImg;
    imgH = heightImg;
    obstacle.resize(imgW,imgH);
    obstacleKid.resize(imgW,imgH);
    vitesseX = vitesseObstacleX; 
    vitesseY = vitesseObstacleY; 
    tailleImpact = tailleImpacts;
  }
  
  Obstacle (PImage img, int x, int y, int widthImg, int heightImg,int tailleImpacts, int vitesseObstacleX, int vitesseObstacleY, PImage imgKid) {
    super(x,y);
    obstacle = img.copy();
    obstacleKid = imgKid.copy();
    imgW = widthImg;
    imgH = heightImg;
    obstacle.resize(imgW,imgH);
    obstacleKid.resize(imgW,imgH);
    vitesseX = vitesseObstacleX; 
    vitesseY = vitesseObstacleY; 
    tailleImpact = tailleImpacts;
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
    this.position.x += vitesseX;
    this.position.y += vitesseY;
  }
  
  void display() {
    
    pushMatrix();
    translate (position.x, position.y);
    
    if(kidObstacle){
      image(obstacleKid,-imgW/2,-imgH/2);
    }else{
      image(obstacle,-imgW/2,-imgH/2); 
    }
    
    impacts.display();
    
    popMatrix();
  }
  
  boolean isTouched(float x,float y){
    
    boolean res = false;
    float alpha;
    float targetX;
    float targetY;
    int position;
    
    if(x >= ( this.position.x - ( imgW/2 ) ) && x <= ( this.position.x + ( imgW/2 ) ) && y >= ( this.position.y - ( imgH/2 ) ) && y <= ( this.position.y + ( imgH/2 ) )){
      targetX = x - ( this.position.x - ( imgW/2 ) );
      targetY = y - ( this.position.y - ( imgH/2 ) );
      position = int (targetY * imgW + targetX);
      alpha = alpha(obstacle.pixels[position]);
      if(alpha != 255){
        res = false;
      }else{
        res = true;
      }
    }
    
    return res;
    
  }
  
  void ajoutImpact(float x,float y,PImage img){
    impacts.ajoutImpact(x - this.position.x, y - this.position.y,tailleImpact,img);
    impacts.setKidmode(kidObstacle);
  }
  
  void cleanAllImpact(){
    impacts.cleanAllImpact();
  }
  
  void setKidmode(boolean kidmode){
    kidObstacle = kidmode;
    impacts.setKidmode(kidmode);
  }
  
}