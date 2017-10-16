//Object of Particles

class ParticleFlow {
  ArrayList<Particle> p = new ArrayList<Particle>();
  PVector location;
  int stoppedLifeTime;
  boolean stop = false;

  ParticleFlow(PVector l) {
    location = l;
  }

  // Add a particle at random 
  void addParticle() {
    float rndNo = random(1);
    if (!stop) {
      if (rndNo >0.66)
        p.add(new StarParticle(location));
      else if (rndNo < 0.33)
        p.add(new Particle(location));
      else
        p.add(new SquareParticle(location));
    }
  }

  void display() {
    for (int i=p.size()-1; i >=0; i--) {
      Particle p1=p.get(i);

      p1.update();
      p1.display();

      //Delete particles that are done
      if (p1.isDone())
        p.remove(i);
    }
    if (stop)
      stoppedLifeTime+=1;
  }

  void applyForce(PVector f) {
    for (int i=p.size()-1; i >=0; i--) {
      Particle p1=p.get(i);
      p1.applyForce(f);
    }
  }

  void stopFlow() {
    stop = true;
  }

  //Returns true if all particles are done flowing
  boolean timeTostop() {
    if (stoppedLifeTime > 255)
      return true;
    return false;
  }
}