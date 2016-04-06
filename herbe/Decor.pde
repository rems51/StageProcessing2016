class Decor{
  
  Grass grass;
  Clouds nuages;
  Background b ;
  Background hills;
  float vitesse = 0;
  int x;
  int y;
  int DWidth;
  int DHeight;

  Decor(int x, int y, int DWidth, int DHeight){
    this.x = x;
    this.y = y;
    this.DWidth = DWidth;
    this.DHeight = DHeight;
    this.grass =new Grass(DWidth,DHeight,0+x,0+y);
    this.nuages = new Clouds(DWidth,DHeight,20,0+x,0+y);
    b = new Background("background0000.png",false,0+x,-100+y,DWidth,DHeight);
    hills = new Background("peaks.png",false,0+x,-450+y,DWidth,DHeight);
    b.resize(0.70);
  }

  void update(float vitesse){
    this.vitesse = vitesse;
    b.update(vitesse*2);
    hills.update(vitesse*1);
    
  }

  void displayBack(){   
    nuages.display(this.vitesse*0.5,0); 
    hills.display();
    b.display(); 
  }
  void displayFront(){   
    grass.display(this.vitesse*3,0);
  }

}