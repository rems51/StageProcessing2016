class ConteneurObstacles {
    
  ArrayList<Obstacle> obstacles = new ArrayList<Obstacle>();
  
  ConteneurObstacles() {
    
  }
  
  void update() {
    for (int i = 0; i < obstacles.size(); i++)  {
      obstacles.get(i).update();
    }
  }
  
  void display() {
    for (int i = 0; i < obstacles.size(); i++)  {
      obstacles.get(i).display();
    }
  }
  
  void display(int i){
    obstacles.get(i).display();
  }
  
  void ajoutObstacle(String img, float x, float y, int tailleImpact){
    obstacles.add(new Obstacle(img,x,y,tailleImpact)); 
  }
  
  int oneIsTouched(float x, float y){
    int res = -1;
    int i = obstacles.size()-1;
    while(res == -1 && i >= 0)  {
      if(obstacles.get(i).isTouched(x,y)){
        res = i;
      }
      i --;
    }
    return res;
  }
  
  //void ajoutImpact(int i, float posX, float posY){
  //  obstacles.get(i).ajoutImpact(posX,posY);
  //}
  
  //void cleanAllImpact(){
  //  for (int i = 0; i < obstacles.size(); i++)  {
  //    cibles.get(i).cleanAllImpact();
  //  }
  //}
  
  Obstacle get(int i){
    return obstacles.get(i);
  }
  
  void ajoutImpact(int i, float posX, float posY){
    obstacles.get(i).ajoutImpact(posX,posY);
  }
  
  void cleanAllImpact(){
    for (int i = 0; i < obstacles.size(); i++)  {
      obstacles.get(i).cleanAllImpact();
    }
  }
  
  
  
}