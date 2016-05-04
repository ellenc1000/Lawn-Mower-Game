class Rock extends GameObject
{

  float theta; // amount by which player is rotated

  float w, halfW;

  Rock (float x, float y)
  {
    super(x, y);
  }

  void update ()
  {

  }


  void render ()
  {
    rectMode(CENTER);

    pushMatrix();
    translate(pos.x, pos.y);
    fill(105);
    noStroke();
    ellipse(0, 0, 30, 30);
    ellipse(15, 5, 20, 20);

    noStroke();
    popMatrix();
  }
}

