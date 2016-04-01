class Clouds {
  
  ArrayList<ObjetGraphique> nuages;
  int CWidth ;
  int CHeight ;
  int x;
  int y;
  
  Clouds(int CWidth, int CHeight, int nbNuage,int x, int y){
    this.CWidth = CWidth;
    this.CHeight = CHeight ;
    this.x =x;
    this.y =y;
    this.nuages = new ArrayList<ObjetGraphique>();
    for(int k = 0; k < nbNuage ; k++){
      nuages.add(new ObjetGraphique("nuage.png"));
      nuages.get(k).update(random(0.05,0.30));
      nuages.get(k).update(x+(int)random(0,CWidth),y+(int)random(0,CHeight/3));
    }
  }
  
  void display(float vitesseX, float vitesseY){
    for(int k = 0; k < nuages.size() ; k++){
      nuages.get(k).x += vitesseX * ((k+1)*(1/(float)nuages.size()));
      nuages.get(k).x += vitesseY * ((k+1)*(1/(float)nuages.size()));
      if(nuages.get(k).x < -nuages.get(k).getWidth()){
        nuages.get(k).x = CWidth ;
      }
      nuages.get(k).display();
    }
  }
  
}