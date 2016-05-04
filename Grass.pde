class Grass extends GameObject
{
  int rows, cols;
  boolean grid[][];
  float test [][];
  float cellWidth;
  float cellHeight;

  Grass(int rows, int cols)
  {
    super(0, 0);
    this.rows = rows;
    this.cols = cols;

    grid = new boolean[rows][cols];

    cellWidth = width / cols;
    cellHeight = height / cols;  

    // set the grid to be all true at the start
    for (int row = 0; row < cols; row ++)
    {      
      for (int col = 0; col < cols; col ++)
      {
        grid[row][col] = true;
      }
    }
  }

  void update()
  {
  }

  void render()
  {
    hit = 0;
    noStroke(); 
    for (int row = 3; row < cols; row ++)
    {
      float y = row * cellHeight;
      for (int col = 3; col < cols; col ++)
      {
        if (grid[row][col])
        {
          fill(0, 153, 51);
        } else
        {
          fill(51, 204, 51);
          hit ++;
        }
        float x = col * cellWidth;
        rect(x, y, cellWidth, cellHeight); 
      }
    }
  }
}

