/* OpenProcessing Tweak of *@*http://www.openprocessing.org/sketch/158875*@* */ /* !do not delete the line above, required for linking your tweak if you upload again */ /* //"Animated_grass_with_perlin_noise" by Kasper Kristensen, licensed under Creative Commons Attribution-Share //Alike 3.0 and GNU GPL license. //Work: http://openprocessing.org/visuals/?visualID= 158875 //License: //http://creativecommons.org/licenses/by-sa/3.0/ //http://creativecommons.org/licenses/GPL/2.0/ */ 
ArrayList<Blade> grass; 
//INCREASE AMOUNT OF JOINTS PER "INCH" // 1 = LOW // 5 = HIGH // Ãƒï¿½Ã¯Â¿Â½Ãƒï¿½Ã‚Â¢Ãƒï¿½Ã‚Â¯Ãƒï¿½Ã‚Â¿Ãƒï¿½Ã‚Â½Ãƒï¿½Ã‚Â¯Ãƒï¿½Ã‚Â¿Ãƒï¿½Ã‚Â½ = INSANITY!!
static int detailLvl = 1; 

void setup() { 
  size(600, 200); 
  grass = new ArrayList(); 
//creates to layers of grass, each with slightly different perlin noise offset 
  for (int x = 0; x < 20; x++) { 
    grass.add(new Blade(new PVector(random(0, width), height), (int)random(5*detailLvl, 10*detailLvl), 0.0)); 
  } 
  for (int x = 0; x < 20; x++) { 
    grass.add(new Blade(new PVector(random(0, width), height), (int)random(5*detailLvl, 10*detailLvl), 1.0)); 
  } 
} 

void draw() { 
  background(100, 220, 255); 
  for (int x = 0; x < grass.size ()-1; x++) { 
    grass.get(x).update(new PVector(mouseX, mouseY), new PVector(mouseX-pmouseX, mouseY-pmouseY));
    grass.get(x).draw(); 
  } 
} 



  

void mousePressed() { 
  grass.add(new Blade(new PVector(random(0, width), height), (int)random(5*detailLvl, 10*detailLvl), 0.5));
}