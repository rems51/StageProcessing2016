class Grass {
  
  ArrayList<Blade> grass;
  float tx = 0;
  int GWidth ;
  int GHeight ;
  int x = 0;
  int y = 0;
  
  Grass(int GWidth, int GHeight, int x, int y){
    this.x = x;
    this.y = y;
    grass =new ArrayList<Blade>();
    this.GWidth = GWidth ;
    this.GHeight = GHeight ;
    for(int i = -50; i < GWidth+50;i++){
      grass.add(new Blade(new PVector(this.x+i,this.y+GHeight)));
    }
  }
  
  void display(float vitesseX,float vitesseY){
    tx += 0.01;
    for(int j = 0; j< grass.size(); j++){
      float n = noise(tx+j/2);
      float x = map(n,0,1,-100,100);
      
      grass.get(j).ancre.x += vitesseX ;
      grass.get(j).ancre.y += vitesseY ;
      
      if(grass.get(j).ancre.x < -50){grass.get(j).ancre.x += GWidth +100;}
      grass.get(j).updateDetailLevel(2);
      grass.get(j).display(x);
    }
  }
}