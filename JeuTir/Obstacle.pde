class Obstacle extends ObjetGraphique{

  PImage obstacle ;
  
  ConteneurImpacts impacts = new ConteneurImpacts();
  
  int tailleImpact ;
  
  Obstacle (String img, float x, float y,int tailleImpacts) {
    obstacle = loadImage(img);
    this.position.x = x;
    this.position.y = y;
    tailleImpact = tailleImpacts;
  }
  
  void update() {

  }
  
  void display() {
    
    pushMatrix();
    translate (position.x, position.y);
    
    image(obstacle,0,0);
    
    impacts.display();
    
    popMatrix();
  }
  
  boolean isTouched(float x,float y){
    
    float calcul = x + y*obstacle.width;
    
    int position = int(calcul);
    
    float alpha;
    
    if(x > width || y > height || calcul < 0){
      alpha = -1;
    }else{
      alpha = alpha(obstacle.pixels[position]);
    }
    
    if(alpha == 0){
      println("Obstacle pas Touché !");
      return false;
    }else{
      println("Obstacle Touché !");
      return true;
    }
  }
  
  void ajoutImpact(float x,float y){
    impacts.ajoutImpact(x - this.position.x, y - this.position.y,tailleImpact);
    //impacts.setKidmode(kidCible);
  }
  
  void cleanAllImpact(){
    impacts.cleanAllImpact();
  }
  
}