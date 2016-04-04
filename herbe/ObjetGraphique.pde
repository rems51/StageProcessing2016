class ObjetGraphique {
  
PImage img;
float taille = 1;
float x;
float y;

  ObjetGraphique(String nom ) {
    img = loadImage(nom);
    img.resize((int)(img.width*taille),(int)(img.height*taille));
  }
  
  void update(int x, int y){
    this.x = x;
    this.y = y;
  }
  
  void resize(float taille){
    this.taille = taille;
    img.resize((int)(img.width*taille),(int)(img.height*taille));
  }
  
  void display(){
    pushMatrix();
    image(img, x, y);
    popMatrix(); 
  }
  
  int getWidth(){
    return img.width;
  }
  
  int getHeight(){
    return img.height;
  }
  
}