class Player extends GameObject
{

  float theta; // amount by which player is rotated

  float w;
  float halfW = 15;

  Player (float x, float y)
  {
    super(x, y);
  }

  void update ()
  {
    forward.x = sin(theta);
    forward.y = -cos(theta);

    if ((pos.x < 50))
    {
      pos.x = 50;
    }
    if ((pos.x > width - 42))
    {
      pos.x = width - 42;
    }
    if ((pos.y < 50))
    {
      pos.y = 50;
    }
    if ((pos.y > height - 42))
    {
      pos.y = height - 42;
    }

    if (gameStart && time > 1)
    {

      if (keys[UP])//equals to true assumed
      {
        pos.add(forward);//adds forward vector , pos+ = forward for unity
        fuel --;
      }
      if (keys[DOWN])//equals to true assumed
      {
        pos.sub(forward);
      }
      if (keys[LEFT])
      {
        theta -= 0.1f;
      }
      if (keys[RIGHT])
      {
        theta += 0.1f;
      }
    }
  }


  int playerCentre = 0; 
  float playerWidth = 30;
  float playerHeight = 30;  


  void render ()
  {
    pushMatrix(); // stores current transformation
    translate(pos.x, pos.y);
    rectMode(CENTER);

    fill(255, 0, 0);
    rotate(theta);
    rect(playerCentre, playerCentre, playerWidth, playerHeight);
    fill(0);
    stroke(0);
    ellipse(0, 0, 20, 20);//ellipse or rect?
    rect(-10, 28, 5, 28);
    rect(10, 28, 5, 28);
    rect(0, 40, 25, 5);

    popMatrix();
  }
}

