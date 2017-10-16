ArrayList<ParticleFlow> particleArray=new ArrayList<ParticleFlow>();
PImage tiger;

void setup() {
  size(640, 480, P2D); // image res
  background(0);
  tiger = loadImage("tiger2.jpg");
}

void draw() {
  background(0);

  // Delete Particle arrays that are done flowing
  for (int i=particleArray.size()-1; i>0; i--) {
    ParticleFlow psTemp = particleArray.get(i);
    if (psTemp.timeTostop()) {
      particleArray.remove(i);
    }
  }
  PVector f = new PVector(0, 0);
  if (keyPressed) {
    if (key == 's')
      f = new PVector(0, .005);
    if (key == 'w')
      f = new PVector(0, -.005);
    if (key == 'd')
      f = new PVector(.01, 0);
    if (key == 'a')
      f = new PVector(-.01, 0 );
  }


  for (ParticleFlow p : particleArray) {
    p.applyForce(f);
    p.addParticle();
    p.display();
  }
}

void mousePressed() {
  particleArray.add(new ParticleFlow(new PVector(mouseX, mouseY)));
}

// key 'r' to stop flow of particle array. FIFO
// Does not delete  
void keyPressed() {
  if (key=='r') {
    int k=0; 
    while (k < particleArray.size()) {
      ParticleFlow p=particleArray.get(k);
      if (!p.stop) {
        p.stopFlow();
        break;
      }
      k++;
    }
  }
}