//Star

class StarParticle extends Particle {

  StarParticle(PVector l) {
    super(l);
  }

  void display() {
    giveColor();
    drawStar (location.x, location.y, size);
  }
}

void drawStar(float x, float y, float size) {
  beginShape();
  vertex(x, y-12*size/15); //1
  vertex(x+2*size/15, y-5*size/15); //2
  vertex(x+13*size/15, y-4*size/15); //3
  vertex(x+5*size/15, y+2*size/15); //4
  vertex(x+9*size/15, y+9*size/15); //5

  vertex(x, y+3*size/15); //6
  vertex(x-9*size/15, y+9*size/15); //7
  vertex(x-5*size/15, y+2*size/15); //8
  vertex(x-13*size/15, y-4*size/15); //9
  vertex(x-2*size/15, y-5*size/15); //10
  endShape(CLOSE);
}