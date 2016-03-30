class Animation {
  //atributs
  PImage[] images;
  int imageCount;
  int frame;
  private String type;
  int timeBetweenFrameMS = 100;
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

  void display(float xpos, float ypos) {
    image(images[frame], xpos, ypos);
  }
  
  void updateFrame(long delta){
    msAnimation += delta;
    if(anim > timeBetweenFrameMS){
      frame = (frame+1) % imageCount;
      anim = 0;
    }
  }
  
  void updateTimeBetweenFrame(int time){ 
    this.timeBetweenFrameMS = time;
  }
  
  int getWidth() {
    return images[0].width;
  }
  
  int getHeigth() {
    return images[0].height;
  }
}