//Square

class SquareParticle extends Particle  {
  
  SquareParticle(PVector l)  {
    super(l);   
  }
    
  void display() {
    giveColor();
    rectMode(CENTER);
    rect(location.x, location.y, size,size);
  }
}