import java.util.Random;

long currentTime;
long previousTime = 0;
long delta;
int tiract = 0;
int tirinterval = 100;

boolean tirmode = false;

ArrayList<Impact> impacts = new ArrayList<Impact>();

Mire m = new Mire(50,50);

float tx = 0;
float ty = 10000;

float gy = 0;
float gx =0;

Random generator;

int delta2 ;

int tempRaffale = 1000;

float deltatemps ;

ArrayList<PVector> path = new ArrayList<PVector>();

int finx = 0;

int finy = 0;

int adx = 0;

int ady = 0;

boolean avance = false ;

void setup(){
  size(800,800);
  generator = new Random();
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

void draw(){
  currentTime = millis();
  delta = currentTime - previousTime;
  update(delta);
  display();
  previousTime = currentTime;
  
  
}

void update(long delta){
  
  tiract += delta;
  if(tiract >= tirinterval){
    tiract = 0;
    if(tirmode){
      impacts.add(new Impact());
      impacts.get(impacts.size()-1).position.x = m.position.x;
      impacts.get(impacts.size()-1).position.y = m.position.y;
    }
  }
  if(tirmode){
    
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
        println("1");
        println((pmouseX +gx) + " gx, limite = " + (pmouseX +finx));
        println((pmouseY +gy) + " gy, limite = " + (pmouseY +finy));
        
      }else if(pmouseX +gx < pmouseX +adx + finx ){
      
        avance = true;
        println("2");
        println((pmouseX +gx) + " gx, limite = " + (pmouseX +adx + finx));
        println((pmouseY +gy) + " gy, limite = " + (pmouseY+ady + finy));
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
    
  }else if(mouseX == pmouseX && mouseY == pmouseY  ){
    float nx = noise(tx);
    tx += 0.01;
    float mx = map(nx,0,1,-20,20);
    
    float ny = noise(ty);
    ty += 0.01;
    float my = map(ny,0,1,-20,20);
    m.update(pmouseX + (int)mx  ,pmouseY+ (int)my);
    
    gx = 0;
    gy = 0;
    
  }else{
    m.update(pmouseX ,pmouseY);
    gx = 0;
    gy = 0;
  }
  
}

void display(){
  background(255,255,255);
  for (int i = 0; i < impacts.size(); i++)  {
    impacts.get(i).display();
  }
  m.display();
}

void mousePressed(){
  tirmode = true;
}

void mouseReleased(){
  tirmode = false;
  delta2 = 0;
}