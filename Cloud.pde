class Cloud extends GameObject
{

  float theta; // amount by which player is rotated

  float w, halfW;

  Cloud (float x, float y)
  {
    super(x, y);
  }

  void update () // movement
  {
    forward.x = sin(theta);
    forward.y = -cos(theta);
    
    pos.add(forward);
  }


  void render () //draw item
  {

    pushMatrix();
    translate(pos.x, pos.y);
    fill(255);
    stroke(0, 0, 255);
    line(0, 0, 0, 40);
    line(-10, -10, -10, 30);
    line(10, 10, 10, 30);
    noStroke();
    rectMode(CENTER);
    rect(0, 0, 30, 20);
    ellipse(0, 0, 30, 40);
    ellipse(-20, 0, 20, 30);
    ellipse(20, 0, 20, 30);
    ellipse(-30, 0, 10, 10);
    ellipse(30, 0, 10, 10);
//    stroke(0, 0, 255);
//    line(0, 50, 0, 50);
    noStroke();
    popMatrix();
  }
}

