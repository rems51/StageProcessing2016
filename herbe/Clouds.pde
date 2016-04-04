class Clouds {
  
  ObjetGraphique nuage;
  Float CWidth ;
  Float CHeight ;
  
  int x;
  int y;
  ArrayList<Float>  posx;
  ArrayList<Float>  posy;
  ArrayList<Float> taille;  
  
  Clouds(int CWidth, int CHeight, int nbNuage,int x, int y){
    this.CWidth = (float)CWidth;
    nuage = new ObjetGraphique("nuage.png");
    this.CHeight = (float)CHeight ;
    this.x = x;
    this.y = y;
    this.posx = new ArrayList<Float>();
    this.posy = new ArrayList<Float>();
    this.taille = new ArrayList<Float>();
    for(int k = 0; k < nbNuage ; k++){
      posx.add(x+(float)((int)random(0,CWidth)));
      posy.add(y+(float)((int)random(0,CHeight/3)));
      taille.add(random(0.05,0.30));
      println(taille.get(k));
    }
  }
  
  void display(float vitesseX, float vitesseY){
    for(int k = 0; k < posx.size() ; k++){
      posx.set(k, posx.get(k) + vitesseX * ((k+1)*(1/ (float)(posx.size()))));
      posy.set(k, posy.get(k) + vitesseY * ((k+1)*(1/ (float)(posx.size()))));
      if(posx.get(k) < - taille.get(k) * nuage.getWidth() ){
        posx.set(k , CWidth) ;
      }//taille.get(k)
      nuage.display(posx.get(k), posy.get(k),nuage.getWidth()*taille.get(k),taille.get(k)*nuage.getHeight());
    }
  }
  
}