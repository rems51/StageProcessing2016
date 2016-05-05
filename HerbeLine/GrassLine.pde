class GrassLine {
  
  ArrayList<Blade> grass;
  float tx = 0;
  PVector pos1 ;
  PVector pos2 ;
  
  GrassLine(PVector pos1 , PVector pos2){
    this.pos1 = pos1;
    this.pos2 = pos2;
    grass =new ArrayList<Blade>();
    
    boolean isRight = this.pos1.x <= this.pos2.x;
    
    for(int i = (int) (isRight ? pos1.x : pos2.x); i <= (int)(isRight ? pos2.x : pos1.x);i++){
      grass.add(new Blade(new PVector(i,((this.pos1.x <= this.pos2.x) ? this.pos1.y : this.pos2.y ))));
    }
    float ecart = (this.pos2.y - this.pos1.y) / grass.size();
    for(int j = 0; j < grass.size(); j++){
      grass.get(j).ancre.y = (isRight? this.pos1.y + (int)(ecart * j) : this.pos2.y - (int)(ecart * j) );
      println(ecart);
    }
    
  }
  
  void display(float vitesseX,float vitesseY){
    tx += 0.01;
    for(int j = 0; j< grass.size(); j++){
      float n = noise(tx+j/2);
      float x = map(n,0,1,-100,100);
      
      grass.get(j).updateDetailLevel(2);
      grass.get(j).display(x);
    }
    stroke(153, 77, 0);
    strokeWeight(5);
    line(this.pos1.x,this.pos1.y,this.pos2.x,this.pos2.y);
  }
}