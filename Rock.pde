class Rock extends GameObject
{

  float theta; // amount by which player is rotated

  float w, halfW;

  Rock (float x, float y)
  {
    super(x, y);
  }

  void update () // movement
  {
//    forward.x = sin(theta);
//    forward.y = -cos(theta);
//    
//    pos.add(forward);
  }


  void render () //draw item
  {
    rectMode(CENTER);

    pushMatrix();
    translate(pos.x, pos.y);
    fill(105);
    noStroke();
//    rect(0, 0, 30, 20);
    ellipse(0, 0, 30, 30);
    ellipse(15, 5, 20, 20);

    noStroke();
    popMatrix();
  }
}

