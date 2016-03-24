class Blade {
  
  float d = -100;
  ArrayList<PVector> positions ;
  PVector ancre ;
  int i ;
  int taille = (int)random(4,7);
  
  float bx ;
  float by ;

  Blade(PVector ancre){
    this.ancre = ancre;
    bx = this.ancre.x;
    by = this.ancre.y;
  }
  
  void update(){
  
  }
  
  void display(float coef){
    
    i = this.taille;
    dessineBout(this.ancre.x, this.ancre.y, 0,d, this.taille,coef);
    
    i = this.taille;
    bx = this.ancre.x;
    by = this.ancre.y;
  }
  
  void dessineBout(float x, float y, float angle, float dim, int taille,float coef){
    i--;
    pushMatrix();
    translate (x, y);
    angle += ((((PI/2*3)/(taille*100))*coef));
    rotate(angle);
    line(0,0,0,dim*2/3);
    if(i>0){
      dessineBout(0,dim*2/3, angle  , dim*2/3,taille,coef);
    }else{
      
    }
    popMatrix();
  }
  
}