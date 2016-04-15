void setup()
{
  size(700, 700);
  background(0, 102, 0);

  mower = new Player(height/2, width/2);
  grass = new Grass (48, 48);
}

PFont summerFont;

boolean startScreen = true; 
boolean gameStart;
int level = 1;
int totalGrass = 0;
int time = 900;

int hit = 0;
int score = 0;

boolean[] keys = new boolean[512];

void keyPressed ()
{
  keys[keyCode] = true;
}

void keyReleased ()
{
  keys[keyCode] = false;
} 

void startScreen()
{
  if (startScreen == true)
  {
    fill(0, 153, 51);
    rect(350, 350, 700, 700);
    fill (0);
    textSize(75);
    text("Lawn Mower", 25, 260);
    textSize(30);
    text("Mow the Lawn in time!", 80, 350);
    text("watch out for X", 170, 400);
    text("use the Arrow keys to Mow", 35, 450);
    text("click to begin", 170, 500);
  }
}

void mouseClicked()
{
  startScreen = false;

  gameStart = true;
}

Player mower;
Grass grass;

void hitDetection ()
{
  // Now turn off a cell on the gameboard if the player is over it!
  int row = (int) (mower.pos.y / grass.cellHeight);
  int col = (int) (mower.pos.x / grass.cellWidth);
  grass.grid[row][col]= false; // collision
}

void gameText ()
{
  score = hit;
  textSize(30);
  text("Grass Cut " + score, 5, 35);
  text("Time " + time, 500, 30);
  text("Level " + level, 500, 700);
}



void draw()
{    
  background(153, 153, 102);
  // stroke(51, 153, 51);

  summerFont = loadFont("KGSummerSunshineBlackout-48.vlw");
  textFont(summerFont);

  if (gameStart)
  {
    time --;//game timer
  }

  grass.update();
  grass.render();

  mower.update();
  mower.render();
  mower.update();
  mower.render();// slow if delete second set not sure why - 

  hitDetection ();
  
  gameText ();

  startScreen();

  println(startScreen);
}

