class Blade {
  //atributs
  float d = (int)random(-200,-50);
  PVector ancre ;
  int taille = (int)random(2,10);
  color couleur ;
  //variables
  int i ;

  //constructeur par defaut
  Blade(PVector ancre){
    this.ancre = ancre;
    int r =  ((int)random(1,11));
    switch(r){
    case 1 : this.couleur = color(102,204,0);
             break;
    case 2 : this.couleur = color(77, 153, 0);
             break;
    case 3 : this.couleur = color(64, 191, 64);
             break;
    case 4 : this.couleur = color(32, 96, 32);
             break;
    case 5 : this.couleur = color(172, 230, 0);
             break;
    case 6 : this.couleur = color(96, 128, 0);
             break;
    case 7 : this.couleur = color(89, 179, 0);
             break;
    case 8 : this.couleur = color(45, 134, 45);
             break;
    case 9 : this.couleur = color(51, 153, 51);
             break;
    case 10 : this.couleur = color(102, 204, 102);
             break;
    default : this.couleur = color(102,204,0);
    
    }
    
  }
  
  // constructeur avec paramètre
  Blade(PVector ancre, int NbBouts, float dimension, color couleur){
    this.ancre = ancre;
    this.d = dimension;
    this.taille = NbBouts;
    this.couleur = couleur;

  }
  //modifications des attributs
  void update(PVector ancre, int NbBouts, float dimension, color couleur){
    this.ancre = ancre;
    this.d = dimension;
    this.taille = NbBouts;
    this.couleur = couleur;
  }
  
  void updateAncre(PVector ancre){
    this.ancre = ancre;
  }
  
  void updateNbBouts(int NbBouts){
    this.taille = NbBouts;
  }
  
  void updateDimension(float dimension){
    this.d = dimension;
  }
  
  void updateCouleur(color couleur){
    this.couleur = couleur;
  }
  
  //affiche le brin dans la fenetre grace aux attributs
  void display(float coef){
    i = this.taille;
    stroke(this.couleur);
    dessineBout(this.ancre.x, this.ancre.y,d, this.taille,coef);   
    i = this.taille;
  }
  
  //permet de dessiner chaque morceau du brin recursivement
  void dessineBout(float x, float y,  float dim, int taille,float coef){

    i--;
    strokeWeight(i); 
    
    pushMatrix();
    translate (x, y);
    rotate(((PI/2)/taille)/100*coef);
    line(0,0,0,dim*2/3);
    if(i>0){
      dessineBout(0,dim*2/3, dim*2/3,taille,coef);
    }
    popMatrix();
  }
  
}