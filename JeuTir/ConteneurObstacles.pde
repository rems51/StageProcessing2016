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
  
  void ajoutObstacle(PImage img, int x, int y, int widthImg, int heightImg,int tailleImpacts, int vitesseObstacleX, int vitesseObstacleY){
    obstacles.add(new Obstacle(img,x,y,widthImg,heightImg,tailleImpacts,vitesseObstacleX,vitesseObstacleY));
  }
  
  void ajoutObstacle(PImage img, int x, int y, int widthImg, int heightImg,int tailleImpacts, int vitesseObstacleX, int vitesseObstacleY, PImage imgKid){
    obstacles.add(new Obstacle(img,x,y,widthImg,heightImg,tailleImpacts,vitesseObstacleX,vitesseObstacleY,imgKid));
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
  
  Obstacle get(int i){
    return obstacles.get(i);
  }
  
  void ajoutImpact(int i, float posX, float posY,PImage img){
    obstacles.get(i).ajoutImpact(posX,posY,img);
  }
  
  void cleanAllImpact(){
    for (int i = 0; i < obstacles.size(); i++)  {
      obstacles.get(i).cleanAllImpact();
    }
  }
  
  void setKidmode(boolean kidmode){
    for (int i = 0; i < obstacles.size(); i++)  {
      obstacles.get(i).setKidmode(kidmode);
    }
  }
  
}