import java.util.Random;

long currentTime;
long previousTime = 0;
long delta;

boolean mouseisclicked = false;

ArmeFeu arme;

PImage fond;

Obstacle poteau1;
Obstacle poteau2;
Obstacle poteau3;


boolean kidmode = false;

ConteneurCibles cibles = new ConteneurCibles();

ArrayList<ObjetGraphique> objGraphiques = new ArrayList<ObjetGraphique>();

void setup(){
  size(800,600);
  arme = new ArmeFeu(100,30);
  arme.setCibles(cibles);
  fond = loadImage("fond_stand_tir.jpg");
  poteau1 = new Obstacle("fond_stand_tir_1.png",0,0);
  poteau2 = new Obstacle("fond_stand_tir_2.png",0,0);
  poteau3 = new Obstacle("fond_stand_tir_3.png",0,0);
  cibles.ajoutCible(0,height/2,15,1);
  cibles.ajoutCible(width/4,height/2+25,9,2);
  cibles.ajoutCible(width/2,height/2+70,3,3);
  objGraphiques.add(arme.getMire());
  objGraphiques.add(poteau1);
  objGraphiques.add(arme.getCible(2));
  objGraphiques.add(poteau2);
  objGraphiques.add(arme.getCible(1));
  objGraphiques.add(poteau3);
  objGraphiques.add(arme.getCible(0));
}

void draw(){
  currentTime = millis();
  delta = currentTime - previousTime;
  update(delta);
  display();
  previousTime = currentTime;
}

void update(long delta){
  arme.update(mouseisclicked);
  if(arme.getNbBalle() <= 0){
    mouseisclicked = false;
  }
  arme.update(delta);
}

void display(){
  image(fond,0,0);
    
  this.displayObjetGraphique();
  
  fill(0);
  text(arme.getNbBalle(),width-40,height-20);
  if(arme.getNbBalle() <= 0){
    text("press r to reload",20,height-20);
  }
  if(arme.cibleHasImpact()){
    text("press c to clean all impact",20,height-40);
  }
  if(!kidmode){
    text("press k to switch to the kid mode",20,20);
  }
  if(kidmode){
    text("press k to switch to the normal mode",20,20);
  }
}

void mousePressed(){
    mouseisclicked = true; 
    
  }
  
void mouseReleased(){
  mouseisclicked = false;
}

void keyPressed(){
  if(key == 'r' && arme.getNbBalle() <= 0){
    arme.recharger();
  }else if(key == 'c' && arme.cibleHasImpact()){
    arme.cleanAllImpact();
  }else if(key == 'k' && !kidmode){
    this.setKidmode();
  }else if(key == 'k' && kidmode){
    this.setKidmode();
  }
}

void setKidmode(){
  if(!kidmode){
    kidmode = true;  
    fond = loadImage("gazon.jpeg");
    arme.setKidmode(kidmode);
  }else if(kidmode){
    kidmode = false;
    fond = loadImage("fond_stand_tir.jpg");
    arme.setKidmode(kidmode);
  }
}

void displayObjetGraphique(){
  for (int i = objGraphiques.size()-1; i >= 0; i--)  {
      objGraphiques.get(i).display();
    }
}