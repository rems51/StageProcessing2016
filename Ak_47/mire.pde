class Mire{
  
  PVector position = new PVector();
  
  Mire(int x, int y){
    position.x = x;
    position.y = y;
  }
  
  void update(int x, int y){
    position.x = x;
    position.y = y; 
  }
  
  void display() {
    
    pushMatrix();
    translate (position.x-50, position.y-50);
    
    fill(0,0,0,0);
    stroke(0);
    ellipse(50,50,100,100);
    line(50,0, 50, 45 );
    line(50,100,50,55);
    line(0,50,45,50);
    line(100,50,55,50);
    stroke(255,0,0);
    point(50,50);
      
    popMatrix();
  }

}