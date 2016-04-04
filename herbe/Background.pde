class Background{
  float x1;
  float y1;
  float x2;
  float y2;
  ObjetGraphique background ;
  int BWidth ;
  int BHeight ;
  boolean isVertical;
  
  Background(String nomImg,boolean isVertical,int x, int y,int BWidth, int BHeight){
    this.isVertical = isVertical;
    this.BWidth =BWidth;
    this.BHeight =BHeight;
    this.background = new ObjetGraphique(nomImg);
    
    this.x1 = x;
    this.y1 = y;
    if(isVertical){
      this.x2 = x;
      this.y2 = y +this.background.getHeight();
    }else{
      this.x2 = x+this.background.getWidth();
      this.y2 = y;
    }
  }
  
  void resize(float taille){
    this.background.resize(taille);
    if(this.x1 < this.x2){
      if(isVertical){
        this.y2 = y1 +this.background.getHeight();
      }else{
        this.x2 = x1 +this.background.getWidth();
      }
    }else{
      if(isVertical){
        this.y1 = y2 +this.background.getHeight();
      }else{
        this.x1 = x2 +this.background.getWidth();
      }   
    }

  }
  
  void display(){
    this.background.display(x1,y1);
    this.background.display(x2,y2);
  }
  
  void update(float vitesse){
    if(isVertical){
      y1 += vitesse;
      y2 += vitesse;
      if(vitesse < 0){      
        if(y1 < - this.background.getHeight() ){
          y1 = y2 + this.background.getHeight();
        } if(y2 < - this.background.getHeight() ){
          y2 = y1 + this.background.getHeight();
        }
      }else{
        if(y1 > this.BHeight){
          y1 = y2 - this.background.getHeight();
        }else if(y2 > this.BHeight){
          y2 = y1 - this.background.getHeight();
        }
      }
    }else{
      x1 += vitesse;
      x2 += vitesse;
      if(vitesse < 0){
        if(x1 < - this.background.getWidth() ){
          x1 = x2 + this.background.getWidth();
        }else if(x2 < - this.background.getWidth()){
          x2 = x1 + this.background.getWidth();
        }
      }else{
        if(x1 > this.BWidth){
          x1 = x2 - this.background.getWidth();
        }else if(x2 > this.BWidth){
          x2 = x1 - this.background.getWidth();
        }
      }
    }
  }
}