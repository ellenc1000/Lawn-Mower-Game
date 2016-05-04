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

    // Move in the direction we are faced
    pos.add(forward);

    ////remove cans
//    if ((pos.x < 0) || (pos.x > width + 10) || (pos.y < 0) || (pos.y > height + 10))
//    {
//      pos.x = -30;
//      pos.y = 500;
//    }
    
//        if (level == 1)
//    {
//      theta = HALF_PI;//direction
//    }

//    if (level == 2)
//    {
//      theta = PI + HALF_PI;
//    }

//if(level == 1 && fuel < 9000 && gotFuel == false)
//{
//      PVector canPos = pos.get();
//      canPos.add(PVector.mult(forward, 30)); // Start the bullet 30 units in front of the player
//      Fuelcan c = new Fuelcan(canPos.x, canPos.y);
//      //cans.add(c);
//}

//    if ((pos.x < 0) || (pos.x > width) || (pos.y < 0) || (pos.y > height))
//    {
//      cans.remove(this);
//    }  
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

