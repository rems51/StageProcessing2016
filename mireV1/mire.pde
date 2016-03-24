class Mire{
  
  int d = 600;
  
  float centerPadding = 0.05;
  
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
    
    translate (position.x, position.y);
    
    strokeWeight(d/100);
    fill(0,0,0,0);
    stroke(0);
    ellipse(0,0,d,d);
    line(0 ,-d/2, 0, (float)(-centerPadding*(float)d) );
    line(0,d/2,0,(float)(centerPadding*(float)d));
    line(-d/2,0,(float)(-centerPadding*(float)d),0);
    line(d/2,0,(float)(centerPadding*(float)d),0);
    stroke(255,0,0);
    point(0,0);
      
    popMatrix();
  }

}