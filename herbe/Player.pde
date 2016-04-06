class Player{
  int x;
  int y;
  
  boolean limitSet = false;
  int xl;
  int xr;

  Animation walk ;
  Animation stay ;
  
  boolean isWalking = false;
  float pv;
  
  Player(int x, int y){
    pv = 0;
    this.walk = new Animation("spriteW","png", 6);
    this.stay = new Animation("spriteS","png", 1);
    this.x = x-stay.getWidth()/2;
    this.y = y-stay.getHeigth();
  }
  
  void setLimits(int xl, int xr){
    this.limitSet = true;
    this.xl = xl;
    this.xr = xr-walk.getWidth();
  }
  
  void update(float vitesseX, float vitesseY){
    this.x += vitesseX;
    this.y += vitesseY;
    if( this.limitSet && (this.x > this.xr || this.x < this.xl )){
        this.x -= vitesseX;
    }
    if(vitesseX < 0.001 && vitesseX > -0.001 && pv < 0){
      walk.updateTimeBetweenFrame((int)( (float)1/ vitesseX* (float)100));
      stay.updateTimeBetweenFrame((int)( (float)1/ vitesseX* (float)100));
      isWalking = false;
      stay.updateDir(true);
    }else if(vitesseX < 0.001 && vitesseX > -0.001 && pv > 0){
      walk.updateTimeBetweenFrame((int)( (float)1/ -vitesseX* (float)100));
      stay.updateTimeBetweenFrame((int)( (float)1/ -vitesseX* (float)100));
      isWalking = false;
      stay.updateDir(false);  
    }else if(vitesseX < 0){
      walk.updateTimeBetweenFrame((int)( (float)1/ -vitesseX* (float)100));
      stay.updateTimeBetweenFrame((int)( (float)1/ -vitesseX* (float)100));
      isWalking = true;
      walk.updateDir(true);
    }else if(vitesseX > 0){
      walk.updateTimeBetweenFrame((int)( (float)1/ vitesseX* (float)100));
      stay.updateTimeBetweenFrame((int)( (float)1/ vitesseX* (float)100));
      isWalking = true;
      walk.updateDir(false);
    }
    pv = vitesseX;
    walk.updatePos(this.x,this.y);
    stay.updatePos(this.x,this.y);
  }
  
  void display(){
    if(this.isWalking){
      walk.display();
    }else{
      stay.display();
    }
  }
  
  void updateFrame(long delta){
    walk.updateFrame(delta);
    stay.updateFrame(delta);
  }

}