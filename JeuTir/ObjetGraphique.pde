abstract class ObjetGraphique {
  
  PVector position = new PVector();
  
  ObjetGraphique(){}
  
  ObjetGraphique(float x, float y){
    this.position.x = x;
    this.position.y = y;
  }
  
  ObjetGraphique(PVector position){
    this.position = position;
  }
  
  public abstract void update();
  
  public abstract void display();
  
}