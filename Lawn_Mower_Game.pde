void setup()
{
  size(700, 700);
  background(0, 102, 0);

  mower = new Player(height/2, width/2);
  grass = new Grass(height/2, width/2);

  board = new float [rows][cols];

  cellWidth = width / cols;
  cellHeight = height / rows;
}

Player mower;
Grass grass;
//ArrayList<Cut> cuts = new ArrayList<Cut>(); 
boolean hit;
boolean gameStart = true;
ArrayList<GameObject> gameObjects = new ArrayList<GameObject>();
boolean[] keys = new boolean [2000];

int count = 0;
int cols = 48;//columns
int rows = 48;//rows
int cellWidth ;
int cellHeight ;

float[][] board;

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
  // println("hit");
  return false;
}

void keyPressed ()
{
  keys[keyCode] = true;
}

void keyReleased ()
{
  keys[keyCode] = false;
} 


ArrayList<Cut> cuts = new ArrayList<Cut>();

void draw()
{    
  background(153, 153, 102);
  // stroke(51, 153, 51);
  hit = false;
  gameStart = true;

  //  grass.update();
  //  grass.render();
  mower.update();
  mower.render();

  //mouseToBoard();
  int dRow = (int) mower.pos.x  / cellHeight;
  int dCol = (int) mower.pos.y / cellWidth ;

  if (board[dRow][dCol] == 1)
  {
    hit = true;
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

fill(0, 102, 0);
      // noFill();
      rect(x, y, cellWidth, cellHeight);
      if (cellBoundingBox() == true && board[dRow][dCol] == 0)
      {
        board[dRow][dCol] = 1;//been hit
        hit = true;
        println("it hit!");
      }
    }
  }
  
    for (int row = 3; row < rows; row ++)
  {
    for (int col = 3; col < cols; col ++)
    {
      int cellWidth = width / cols;
      int cellHeight = height / rows;

      float x = dRow * cellWidth;
      float y = dCol * cellHeight;

      float[][] board;

      board = new float [rows][cols];

      rect(x, y, cellWidth, cellHeight);//the actual cells

      if (gameStart == true && hit == false)
      { 
        board[dRow][dCol] = 1;
      }

      if (board[dRow][dCol] == 0 && hit == true)//kill cell
      {
        stroke(153, 102, 51);
        fill(102, 255, 102);
        board[dRow][dCol] = 1;
        println("go");
        //println(row, col);
      } else if (board[dRow][dCol]==1)//dont kill
      {
        stroke(0, 90, 0);
        fill(0, 255, 0);
        //println("go");
      }
      //println(dRow,dCol);//shows coordinates
      //println(cellBoundingBox());
      //println(hit);
      rect(x, y, cellWidth, cellHeight);//the actual cells
      //println(dRow,dCol);//shows coordinates
    }
  }
  
  if(hit = true)
  {
   for (int i = cuts.size() -1 ; i >= 0  ; i --)
  {
    Cut grassCut = cuts.get(i);
    cuts.add(grassCut);
    grassCut.update();
    grassCut.render(); 
  }
  }

  mower.update();
  mower.render();
}

