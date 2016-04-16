void setup()
{
  size(700, 700);
  background(0, 102, 0);

  mower = new Player(height/2, width/2);
  grass = new Grass (48, 48);

  canPosX = random(100, 600);
  canPosY = -10;


  can = new Fuelcan (canPosX, canPosY);
  can2 = new Fuelcan (canPosX, canPosY);


  time = totalTime;
}

Player mower;
Grass grass;
Fuelcan can;
Fuelcan can2;

PFont summerFont;

boolean startScreen = true; 
boolean gameStart;
int level = 0;
int time;
int totalTime = 900;
int fullFuel = 10000;
boolean gotFuel = false;
int hit;
int score;
float canPosX;
float canPosY;

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
  rectMode(CENTER);
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
    text("click to begin", 170, 650);
  }
}

void mouseClicked()
{
  startScreen = false;
  gameStart = true;
  reset ();
}

void hitDetection ()
{
  // Now turn off a cell on the gameboard if the player is over it!
  int row = (int) (mower.pos.y / grass.cellHeight);
  int col = (int) (mower.pos.x / grass.cellWidth);
  grass.grid[row][col]= false; // collision
}


int fuel = fullFuel; 

void gameText ()
{
  int fuelX = 555;
  int fuelY = 6;
  int fuelWidth = 130;
  int fuelHeight = 23; 
  score = hit;
  textSize(30);
  text("Grass Cut " + score, 5, 35);
  text("Lawn " + level, 500, 700);
  //text("Time " + time, 500, 30);
  text("Fuel ", 450, 35);
  rectMode(CORNER);
  fill(0);
  rect(fuelX - 3, fuelY - 3, fuelWidth, fuelHeight + 6);
  fill(255, 0, 0);
  rect(fuelX, fuelY, fuel/80, fuelHeight);
}

void levelEnd()
{
  int nextLevel = level + 1;
  if (fuel <= 0)
  {
    gameStart = false;
    text("You Cut " + score + " blades of grass!", 20, 250);
    text("You ran out of fuel", 100, 350);
    text("click to start level " + nextLevel, 100, 450);

    if (gameStart == false && keyPressed)
    {
      if (key == ' ')
      {
        reset();
      }
    }
  }
}


ArrayList<Fuelcan> cans = new ArrayList<Fuelcan>(); 

void spawnCan ()
{
  if (level == 1 && fuel < 10000 && fuel > 3000 && gotFuel == false)// when can spawn
  {
    can.update();
    can.render();
  }
  
  if(level == 1 && fuel < 2000)
  {
  gotFuel = false;
  }

  if (level == 1 && fuel < 2000 && gotFuel == false)
  {
    can2.update();
    can2.render();
  }
  
//      for (int i = cans.size() -1 ; i >= 0  ; i --)
//  {
//    Fuelcan c = cans.get(i);
//    c.update();
//    c.render(); 
//  } 

  if (PVector.dist(can.pos, mower.pos) < mower.halfW)
  {
    fuel = fullFuel;
    gotFuel = true;
  }
}


void draw()
{
  rectMode(CENTER);
  background(153, 153, 102);

  summerFont = loadFont("KGSummerSunshineBlackout-48.vlw");
  textFont(summerFont);

  grass.update();
  grass.render();

  spawnCan ();

  mower.update();
  mower.render();
  mower.update();
  mower.render();// slow if delete second set not sure why - 

  hitDetection ();

  gameText ();

  startScreen();

  levelEnd();

  println(fuel);
}

void reset()
{
  setup();
  level +=1;
  fuel = fullFuel;
  gotFuel = false;
}

