// The class name starts with uppercase
class Fuelcan extends GameObject
{ 

  int maxHealth = 100;
  int health = maxHealth;
  float speed = 10.0f;

  Fuelcan(float x, float y)
  {
    super(x, y);
  }

  void update()
  {
    theta = PI;

    forward.x = sin(theta);
    forward.y = - cos(theta);
    pos.add(forward); 
  }

  void render()
  {
    pushMatrix();
    translate(pos.x, pos.y);
    fill(255, 0, 0);
    stroke(0);
    rect(0, 0, 20, 30);
    fill(0);
    rect(5, - 20,5, 10);
    line(-8, -15, 8, 15);
    line(-8, 15, 8, -15);
    noStroke();
    popMatrix();
  }
}

