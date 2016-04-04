import java.util.Random;

long currentTime;
long previousTime = 0;
long delta;

boolean mouseisclicked = false;

ArmeFeu arme;

PImage fond;
PImage fondKid;
PImage cible_mouvante;
PImage cible_kid;
PImage fond_stand_tir_1;
PImage fond_stand_tir_2;
PImage fond_stand_tir_3;
PImage impactKid;

boolean kidmode = false;

ConteneurObstacles obstacles = new ConteneurObstacles();

ArrayList<ObjetGraphique> objGraphiques = new ArrayList<ObjetGraphique>();

void setup(){
  size(800,600);
  arme = new ArmeFeu(100,30);
  arme.setObstacles(obstacles);
  fond = loadImage("fond_stand_tir.jpg");
  fondKid = loadImage("plage.JPG");
  cible_mouvante = loadImage("cible_mouvante.png");
  cible_kid = loadImage("cible_kid.png");
  fond_stand_tir_1 = loadImage("fond_stand_tir_1.png");
  fond_stand_tir_2 = loadImage("fond_stand_tir_2.png");
  fond_stand_tir_3 = loadImage("fond_stand_tir_3.png");
  impactKid = loadImage("fleur.png");
  arme.setImageImpactKid(impactKid);
  obstacles.ajoutObstacle(cible_mouvante, 0,height/2, height/15, height/15, 15, 1, 0,cible_kid); 
  obstacles.ajoutObstacle(fond_stand_tir_3,width/2,height/2,800,600,15,0,0);
  obstacles.ajoutObstacle(cible_mouvante, width/4,height/2+25, height/9, height/9, 9, 2, 0,cible_kid); 
  obstacles.ajoutObstacle(fond_stand_tir_2,width/2,height/2,800,600,9,0,0);
  obstacles.ajoutObstacle(cible_mouvante, width/2,height/2+70, height/3, height/3, 3, 3, 0,cible_kid);
  obstacles.ajoutObstacle(fond_stand_tir_1,width/2,height/2,800,600,3,0,0);
  objGraphiques.add(arme.getMire());
  objGraphiques.add(arme.getObstacle(5));
  objGraphiques.add(arme.getObstacle(4));
  objGraphiques.add(arme.getObstacle(3));
  objGraphiques.add(arme.getObstacle(2));
  objGraphiques.add(arme.getObstacle(1));
  objGraphiques.add(arme.getObstacle(0));
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
  this.updateObjetGraphique();
}

void display(){
  if(kidmode){
    image(fondKid,0,0);
  }else{
    image(fond,0,0);
  }
    
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
    arme.setKidmode(kidmode);
  }else if(kidmode){
    kidmode = false;
    arme.setKidmode(kidmode);
  }
}

void displayObjetGraphique(){
  for (int i = objGraphiques.size()-1; i >= 0; i--)  {
      objGraphiques.get(i).display();
    }
}

void updateObjetGraphique(){
  for (int i = objGraphiques.size()-1; i >= 0; i--)  {
      objGraphiques.get(i).update();
    }
}