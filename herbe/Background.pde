class Background{
  int x1;
  int y1;
  int x2;
  int y2;
  ObjetGraphique background1 ;
  ObjetGraphique background2 ;
  int BWidth ;
  int BHeight ;
  boolean isVertical;
  
  Background(String nomImg,boolean isVertical,int x, int y,int BWidth, int BHeight){
    this.isVertical = isVertical;
    this.BWidth =BWidth;
    this.BHeight =BHeight;
    this.background1 = new ObjetGraphique(nomImg);
    this.background2 = new ObjetGraphique(nomImg);
    
    this.x1 = x;
    this.y1 = y;
    if(isVertical){
      this.x2 = x;
      this.y2 = y +this.background1.getHeight();
    }else{
      this.x2 = x+this.background1.getWidth();
      this.y2 = y;
    }
    this.background1.update(this.x1,this.y1);
    this.background2.update(this.x2,this.y2);
  }
  
  void resize(float taille){
    this.background1.resize(taille);
    this.background2.resize(taille);
    if(this.x1 < this.x2){
      if(isVertical){
        this.y2 = y1 +this.background1.getHeight();
      }else{
        this.x2 = x1 +this.background1.getWidth();
      }
    }else{
      if(isVertical){
        this.y1 = y2 +this.background2.getHeight();
      }else{
        this.x1 = x2 +this.background2.getWidth();
      }    
    }
    this.background2.update(x2,y2);
    this.background1.update(x1,y1);
  }
  
  void display(){
    this.background1.display();
    this.background2.display();
    println("x1 = "+ x1+", y1 = "+y1);
    println("x2 = "+ x2+", y2 = "+y2);
  }
  
  void update(float vitesse){
    if(isVertical){
      y1 += vitesse;
      y2 += vitesse;
      if(vitesse < 0){      
        if(y1 < - this.background1.getHeight() ){
          y1 = y2 + this.background2.getHeight();
        } if(y2 < - this.background2.getHeight() ){
          y2 = y1 + this.background1.getHeight();
        }
      }else{
        if(y1 > this.BHeight){
          y1 = y2 - this.background2.getHeight();
        }else if(y2 > this.BHeight){
          y2 = y1 - this.background1.getHeight();
        }
      }
    }else{
      x1 += vitesse;
      x2 += vitesse;
      if(vitesse < 0){
        if(x1 < - this.background1.getWidth() ){
          x1 = x2 + this.background1.getWidth();
        }else if(x2 < - this.background2.getWidth()){
          x2 = x1 + this.background2.getWidth();
        }
      }else{
        if(x1 > this.BWidth){
          x1 = x2 - this.background1.getWidth();
        }else if(x2 > this.BWidth){
          x2 = x1 - this.background2.getWidth();
        }
      }
    }
    this.background2.update(x2,y2);
    this.background1.update(x1,y1);
  }
}