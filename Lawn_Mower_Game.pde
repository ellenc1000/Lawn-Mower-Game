void setup()
{
  size(700, 700);
  background(0, 102, 0);

  mower = new Player(height/2, width/2);
  grass = new Grass (48, 48);  
}

Player mower;
Grass grass;

boolean gameStart = true;
int totalGrass = 0;
int time = 6000;

float test [][];
int hit = 0;

boolean[] keys = new boolean[512];

void keyPressed ()
{
  keys[keyCode] = true;
}

void keyReleased ()
{
  keys[keyCode] = false;
} 


void draw()
{    
  background(153, 153, 102);
  // stroke(51, 153, 51);
  
  time -= 1;//game timer 

  grass.update();
  grass.render();
  
  mower.update();
  mower.render();
  mower.update();
  mower.render();// slow if delete second set not sure why - 
  
  // Now turn off a cell on the gameboard if the player is over it!
  int row = (int) (mower.pos.y / grass.cellHeight);
  int col = (int) (mower.pos.x / grass.cellWidth);
  grass.grid[row][col]= false; // collision
  
//  if(grass.grid[row][col] == false)
//  {
//  hit = true;
//  }
  
  textSize(32);
  text("Grass Cut " + hit, 5, 30);
  //text("Time " + time, 550, 30);

//println(totalGrass);

}

