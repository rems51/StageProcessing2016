class Face {
  PVector position = new PVector();
  float angle = 0.0;
  
  Face () {
    
  }
  
  void update() {
    angle += 1/TWO_PI;
  }
  
  void display() {
    
    pushMatrix();
    translate (position.x, position.y);
    rotate (angle);
    ellipse (0, 0, 50, 50);
    ellipse (- 15, - 15, 5, 5);
    ellipse (15, -15, 5, 5);
    popMatrix();
  }
}