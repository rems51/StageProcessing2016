class ObjetGraphique {
  
PImage img;
float taille = 1;
float x;
float y;

  ObjetGraphique(String nom ) {
    img = loadImage(nom);
    img.resize((int)(img.width*taille),(int)(img.height*taille));
  }
  
  void update(float x, float y){
    this.x = x;
    this.y = y;
  }
  
  void resize(float taille){
    this.taille = taille;
    img.resize((int)(img.width*taille),(int)(img.height*taille));
  }
  
  void resize(float Iwidth, float Iheight){
    img.resize((int)(Iwidth),(int)(Iheight));
  }
  
  
  void display(){
    pushMatrix();
    image(img, x, y);
    popMatrix(); 
  }
  
  void display(float posx, float posy){
    pushMatrix();
    image(img, posx, posy);
    popMatrix(); 
  }
  
  void display(float posx, float posy, float Iwidth, float Iheight){
    pushMatrix();
    image(img, posx, posy,Iwidth,Iheight);
    popMatrix(); 
  }
  
  int getWidth(){
    return img.width;
  }
  
  int getHeight(){
    return img.height;
  }
  
}