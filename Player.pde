class Player extends GameObject
{

  float theta;

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

    if (gameStart)
    {

      if (keys[UP])//equals to true assumed
      {
        pos.add(forward);
        if (level == 1)
        {
          fuel -= 1;
        }
        if (level == 2)
        {
          fuel -= 2;
        }
        if (level == 3)
        {
          fuel -= 3;
        }
        if (level == 4)
        {
          fuel -= 4;
        }
        if (level == 5)
        {
          fuel -= 5;
        }
      } 
      if (keys[DOWN])
      {
        pos.sub(forward);
        if (level == 1)
        {
          fuel -= 1;
        }
        if (level == 2)
        {
          fuel -= 2;
        }
        if (level == 3)
        {
          fuel -= 3;
        }
        if (level == 4)
        {
          fuel -= 4;
        }
        if (level == 5)
        {
          fuel -= 5;
        }
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
    ellipse(0, 0, 20, 20);
    rect(-10, 28, 5, 28);
    rect(10, 28, 5, 28);
    rect(0, 40, 25, 5);

    popMatrix();
  }
}

