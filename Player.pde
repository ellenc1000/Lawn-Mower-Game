class Player extends GameObject
{

  float theta; // amount by which player is rotated

  float w, halfW;

  Player (float x, float y)
  {
    super(x, y);
    //values
//    w = 50.0f;
//    halfW = w / 2;
    boolean[][] board;

  }

  void update ()
  {
    forward.x = sin(theta);
    forward.y = -cos(theta);
    
     if ((pos.x < 50))
    {
      pos.x = 50;
    }
     if ((pos.x > width - 50))
    {
      pos.x = width - 50;
    }
     if ((pos.y < 50))
    {
     pos.y = 50; 
    }
     if ((pos.y > height - 50))
    {
      pos.y = height - 50;
    }
    
//    if (play)
//    {
//      Cut c = new Cut (pos.x, pos.y, theta);
//      cuts.add(c);
//    }

    if (keys[UP])//equals to true assumed
    {
      pos.add(forward);//adds forward vector , pos+ = forward for unity
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
  
  void grassUpdate ()
  {
    
  }
}
