class ArmeFeu {
  
  int tiract = 0;
  int tirinterval;
  
  int nbBalleChargeur;
  
  int tempRaffale = 1000;
  float deltatemps ;

  boolean tirmode = false;

  Mire m = new Mire(50,50);

  float tx = 0;
  float ty = 10000;

  float gy = 0;
  float gx =0;
  
  Random generator;
  
  ArrayList<PVector> path = new ArrayList<PVector>();
  
  int finx = 0;
  int finy = 0;

  int adx = 0;
  int ady = 0;

  boolean avance = false ;
  
  int delta2 ;
  
  boolean kidarme = false;
  
  boolean firstShoot = true;
  
  ConteneurImpacts impacts = new ConteneurImpacts();
  
  ConteneurCibles cibles;
  
  ArmeFeu (int interval,int nbBalle) {
    generator = new Random();
    tirinterval = interval;
    nbBalleChargeur = nbBalle;
    path.add(new PVector(0,-100));
    path.add(new PVector(-100,-100));
    path.add(new PVector(200,0));
    deltatemps = tempRaffale/path.size();
    for(PVector point : path){
      finx += point.x;
      finy += point.y;
    }
    adx = finx - (int)path.get(path.size()-1).x - finx;
    ady = finy - (int)path.get(path.size()-1).y - finy;
  }
  
  void update(boolean mouseisclicked){
     
    tirmode = mouseisclicked;
    if(!mouseisclicked){
      delta2 = 0;
      firstShoot = true;
    }
  }
  
  void update(long delta) {
    
    cibles.update();
    
    tiract += delta;
    if(tiract >= tirinterval && nbBalleChargeur > 0){
      tiract = 0;
      if(tirmode){
        int i = cibles.oneIsTouched(m.position.x,m.position.y);
        if(i != -1){
          cibles.ajoutImpact(i,m.position.x,m.position.y);
          nbBalleChargeur -= 1;
          firstShoot = false;
        }else {
          if(impacts.ajoutImpact(m.position.x,m.position.y,1)){
            nbBalleChargeur -= 1;
            firstShoot = false;
          }
          if(kidarme){
            impacts.get(impacts.size()-1).setKidmode(kidmode);
          }
        }
      }
    }
    if(!firstShoot && tirmode && nbBalleChargeur > 0){  
      if(delta2 < tempRaffale-1){
    
        float num = (float) generator.nextGaussian();
        float sd = 3;
        float mean = (path.get(((int)(delta2/deltatemps))).x) * (delta/deltatemps );
        gx += sd * num + mean;
        
        num = (float) generator.nextGaussian();
        sd = 2;
        mean = (path.get(((int)(delta2/deltatemps))).y)*(delta/deltatemps );
        gy += (sd * num + mean);
        
        m.update(pmouseX + (int)gx  ,pmouseY+ (int)gy);
        
        delta2 += (int)delta;
      }else if(delta2 >= tempRaffale-1){
        
        if(pmouseX +gx > pmouseX +finx ){
  
          avance = false ;
        
        }else if(pmouseX +gx < pmouseX +adx + finx ){
      
          avance = true;

        }
      
        if(avance){
          
          float num = (float) generator.nextGaussian();
          float sd = 3;
          float mean = -adx * (delta/deltatemps );
          gx += sd * num + mean;
          
          num = (float) generator.nextGaussian();
          sd = 2;
          mean = -ady *(delta/deltatemps );
          gy += (sd * num + mean);
          
          m.update(pmouseX + (int)gx  ,pmouseY+ (int)gy);
        
        }else{
        
          float num = (float) generator.nextGaussian();
          float sd = 3;
          float mean = adx * (delta/deltatemps );
          gx += sd * num + mean;
          
          num = (float) generator.nextGaussian();
          sd = 2;
          mean = ady *(delta/deltatemps );
          gy += (sd * num + mean);
          
          m.update(pmouseX + (int)gx  ,pmouseY+ (int)gy);
        
       }
        
    }
    
    }else {
      float nx = noise(tx);
      tx += 0.01;
      float mx = map(nx,0,1,-20,20);
    
      float ny = noise(ty);
      ty += 0.01;
      float my = map(ny,0,1,-20,20);
      m.update(pmouseX + (int)mx  ,pmouseY+ (int)my);
    
      gx = 0;
      gy = 0;
    
    }
  }
  
  void display() {
    
    //impacts.display();
    
    cibles.display();
    
    m.display();
  }
  
  int getNbBalle(){
    return nbBalleChargeur;
  }
  
  void recharger(){
    nbBalleChargeur = 30;
  }
  
  boolean cibleHasImpact(){
    return impacts.cibleHasImpact();
  }
  
  void cleanAllImpact(){
    impacts.cleanAllImpact();
    cibles.cleanAllImpact();
  }
  
  void setKidmode(boolean kidmode){
    kidarme = kidmode;
    impacts.setKidmode(kidmode);
    cibles.setKidmode(kidmode);
  }
  
  void setCibles(ConteneurCibles lesCibles){
    cibles = lesCibles;
  }
  
  void displayMire(){
    m.display();
  }
  
  void displayCible(int i){
    cibles.display(i);
  }
  
  Cible getCible(int i){
    return cibles.get(i);
  }
  
  Mire getMire(){
    return this.m;
  }
}