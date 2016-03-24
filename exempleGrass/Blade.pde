class Blade { 
  PVector anchor; 
  float offset;
  color green;
  float stiffness;
  ArrayList<PVector> segments;
  
   Blade(PVector setAnchor, int setSegments, float preOffset) { 
     anchor = setAnchor; segments = new ArrayList(); 
     for (int x = 0; x < setSegments; x++) {
        segments.add(new PVector(anchor.x, anchor.y+10*x)); 
      } 
    offset = random(100)/100 + preOffset;
    green = color((int)random(0, 50), (int)random(100, 255), (int)random(0, 100)); 
    stiffness = random(1, 2); 
  //grounding force 
    segments.get(0).x = anchor.x; 
    segments.get(0).y = anchor.y;
  } 
  
  void update(PVector blow, PVector force) { 
  //perlin noise wind, slightly offset from every other blade 
    float wind = (noise(frameCount/100.0+offset)-0.5); 
  //apply forces to each blade segment 
    for (int x = 1; x < segments.size (); x++) {
      PVector segment = segments.get(x); 
      segment.y -= (((segments.size ()-x)*1)/detailLvl)*stiffness; 
      segment.x += x*wind*(4/detailLvl); 
    //effect of mouse acceleration 
      float secondWind = dist(blow.x, blow.y, segment.x, segment.y); 
      if (secondWind < 100) { 
        segment.x += force.x*(20/secondWind*(4/detailLvl));
        segment.y += force.y*(20/secondWind*(4/detailLvl)); 
      }
    }
  //pull joints together
    for (int x = 0; x < segments.size ()-1; x++) {
      PVector joint = PVector.sub(segments.get(x), segments.get(x+1));
      if (joint.mag() > 5*(4/detailLvl)) { 
        joint.normalize(); 
        joint.mult(-5*(4/detailLvl)); 
        segments.get(x+1).x = segments.get(x).x + joint.x; 
        segments.get(x+1).y = segments.get(x).y + joint.y; 
      } 
    }
  }
  
  void draw() {
    fill(green); 
    stroke(green); 
    grassBlade_v2(segments); 
  } 
  
  void grassBlade_v2(ArrayList<PVector> segments) { 
  int h = segments.size ()-2;
  beginShape(TRIANGLE_STRIP); 
  
    for (int x = 0; x < segments.size ()-1; x++) {
      PVector segment = segments.get(x); 
      vertex(segment.x+5*((h-x)/h), segment.y); 
      vertex(segment.x-5*((h-x)/h), segment.y);
    }
  endShape(); 
}

}