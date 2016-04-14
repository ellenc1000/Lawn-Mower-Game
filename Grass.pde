class Grass extends GameObject
{

  Grass(float x, float y)
  {
    super(x, y);
    this.theta = theta;
    int cols = 100;//columns
    int rows = 100;//rows
  }


  int cols = 100;//columns
  int rows = 100;//rows
  int cellWidth = width / cols;
  int cellHeight = height / rows;

  boolean cellBoundingBox()
  {
    
    float x = mower.pos.x;
float y = mower.pos.y; 

    if (mower.pos.x + 30 < x)
    {
      return true;
    }

    if (mower.pos.x - 30 > x)
    {
      return true;
    }

    if (mower.pos.y - 30 < y)
    {
      return true;
    }

    if (mower.pos.y + 30 > y)
    {
      return true;
    }
    println("hit");
    return false;
  }


  void render()
  {

    //       if (PVector.dist(row, player.pos) < aiShip.halfW)
    //    {
    //      aiShip.health --;
    //    }

    int cols = 48;//columns
    int rows = 48;//rows

    for (int row = 3; row < rows; row ++)
    {
      for (int col = 3; col < cols; col ++)
      {
        int cellWidth = width / cols;
        int cellHeight = height / rows;

        float x = col * cellWidth;
        float y = row * cellHeight;

        float[][] board;

        board = new float [rows][cols];

        if (gameStart == true && hit == false)
        { 
          board[row][col] = 1;
        }

        if (board[row][col] == 0 && hit == true)//kill cell
        {
          stroke(153, 102, 51);
          fill(102, 255, 102);
          println("go");
          println(row, col);
        } else if (board[row][col]==1)//dont kill
        {
          stroke(0, 90, 0);
          fill(0, 102, 0);
        }
        rect(x, y, cellWidth, cellHeight);//the actual cells
      }
    }


    for (int row = 3; row < rows; row ++)
    {
      for (int col = 3; col < cols; col ++)
      {
        int cellWidth = width / cols;
        int cellHeight = height / rows;

        float x = col * cellWidth;
        float y = row * cellHeight;

        float[][] board;

        board = new float [rows][cols];

        noFill();
        rect(x, y, cellWidth, cellHeight);
        if (!cellBoundingBox() && board[row][col] == 1)
        {
          board[row][col] = 0;
          hit = true;
        }
      }
    }
  }


  void update()
  {
    forward.x = sin(theta);
    forward.y = -cos(theta);
  }
}
