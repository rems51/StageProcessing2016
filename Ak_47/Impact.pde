class Impact {
  PVector position = new PVector();
  
  Impact () {
    
  }
  
  void update() {
    
  }
  
  void display() {
    
    pushMatrix();
    translate (position.x, position.y);
    fill(0);
    stroke(150);
    ellipse (0, 0, 10, 10);
    popMatrix();
  }
}