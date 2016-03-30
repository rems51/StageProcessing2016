class Obstacle extends ObjetGraphique{

  PImage obstacle ;
  
  ConteneurImpacts impacts = new ConteneurImpacts();
  
  Obstacle (String img, float x, float y) {
    obstacle = loadImage(img);
    this.position.x = x;
    this.position.y = y;
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
  
}