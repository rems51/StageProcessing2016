class ConteneurImpacts {
    
  ArrayList<Impact> impacts = new ArrayList<Impact>();
  
  ConteneurImpacts () {
    
  }
  
  void update() {
    
  }
  
  void display() {
    for (int i = 0; i < impacts.size(); i++)  {
      impacts.get(i).display();
    }
  }
  
  boolean ajoutImpact(float x, float y,int z,PImage img){
    impacts.add(new Impact(z,img));
    impacts.get(impacts.size()-1).position.x = x;
    impacts.get(impacts.size()-1).position.y = y;
    return true;
  }
  
  void setKidmode(boolean kidmode){
    for (int i = 0; i < impacts.size(); i++)  {
      impacts.get(i).setKidmode(kidmode);
    }
  }
  
  void cleanAllImpact(){
    impacts = new ArrayList<Impact>();
  }
  
  boolean cibleHasImpact(){
    if(impacts.size() > 0){
      return true;
    }else{
      return false;
    }
  }
  
  int size(){
    return impacts.size();
  }
  
  Impact get(int i){
    return impacts.get(i);
  }
    
}