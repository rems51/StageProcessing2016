class ConteneurCibles {
    
  ArrayList<Cible> cibles = new ArrayList<Cible>();
  
  ConteneurCibles() {
    
  }
  
  void update() {
    for (int i = 0; i < cibles.size(); i++)  {
      cibles.get(i).update();
    }
  }
  
  void display() {
    for (int i = 0; i < cibles.size(); i++)  {
      cibles.get(i).display();
    }
  }
  
  void display(int i){
    cibles.get(i).display();
  }
  
  void ajoutCible(int posX, int posY,int z, int vitesseCible){
    cibles.add(new Cible(posX,posY,z,vitesseCible)); 
  }
  
  int oneIsTouched(float x, float y){
    int res = -1;
    int i = cibles.size()-1;
    while(res == -1 && i >= 0)  {
      if(cibles.get(i).isTouched(x,y)){
        res = i;
      }
      i --;
    }
    return res;
  }
  
  void ajoutImpact(int i, float posX, float posY){
    cibles.get(i).ajoutImpact(posX,posY);
  }
  
  void cleanAllImpact(){
    for (int i = 0; i < cibles.size(); i++)  {
      cibles.get(i).cleanAllImpact();
    }
  }
  
  void setKidmode(boolean kidmode){
    for (int i = 0; i < cibles.size(); i++)  {
      cibles.get(i).setKidmode(kidmode);
    }
  }
  
  Cible get(int i){
    return cibles.get(i);
  }
  
  
  
}