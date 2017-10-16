//Circle

class Particle {
  int size= 10;
  int lifespan=255;
  PVector location, velocity, acceleration;

  Particle(PVector l) {
    acceleration = new PVector(0, 0.05);
    velocity = new PVector(random(-1, 1), random(-3, 1));
    location = l.get();
  }

  void display() {
    giveColor();
    ellipse (location.x, location.y, size, size);
  }

  void giveColor() {
    color c = tiger.get(int(location.x), int(location.y));
    fill(c);
    noStroke();
  }
  
  void applyForce(PVector force) {
    acceleration.add(force);
  }

  // Move particle
  void update() {
    lifespan-=3;
    velocity.add(acceleration);
    location.add(velocity);
  }

  boolean isDone() {
    if (lifespan<0)
      return true;
    return false;
  }
  
}