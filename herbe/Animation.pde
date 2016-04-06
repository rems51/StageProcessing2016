class Animation {
  //atributs
  PImage[] images;
  int imageCount;
  int frame;
  private String type;
  int timeBetweenFrameMS = 100;
  int x = 0;
  int y = 0;
  boolean isFlip = false;
  //variables
  int msAnimation = 0;
  
  Animation(String imagePrefix, String type, int count) {
    imageCount = count;
    images = new PImage[imageCount];
    this.type = type;

    for (int i = 0; i < imageCount; i++) {
      // Use nf() to number format 'i' into four digits
      String filename = imagePrefix + nf(i, 4) + "."+ this.type;
      images[i] = loadImage(filename);
    }
  }

  void display() {
    pushMatrix();
    if(this.isFlip){
      translate(this.x + images[frame].width, this.y);
      scale(-1, 1);
    }else{
      translate(this.x , this.y);
    }
    
    image(images[frame], 0 , 0);
     
    popMatrix();
   
  }
  
  void updatePos(int x, int y){
    this.x = x;
    this.y = y;
  }
  
  void updateDir(boolean isFlip){
    this.isFlip = isFlip;
  }
  
  void update(float vitesseX, float vitesseY){
    this.x += vitesseX;
    this.y += vitesseY;
  }
  
  void updateFrame(long delta){
    msAnimation += delta;
    if(msAnimation > timeBetweenFrameMS){
      frame = (frame+1) % imageCount;
      msAnimation = 0;
    }
  }
  
  void updateTimeBetweenFrame(int time){ 
    println();
    this.timeBetweenFrameMS = time;
  }
  
  
  
  int getWidth() {
    return images[0].width;
  }
  
  int getHeigth() {
    return images[0].height;
  }
}