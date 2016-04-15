void setup()
{
  size(700, 700);
  background(0, 102, 0);

  mower = new Player(height/2, width/2);
  grass = new Grass (48, 48);

  time = totalTime;
}

PFont summerFont;

boolean startScreen = true; 
boolean gameStart;
int level = 0;
int time;
int totalTime = 900;

//String time = "60";
//int t = 1;
//int interval = 60;

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
    text("click to begin", 170, 650);
  }
}

void mouseClicked()
{
  startScreen = false;
  gameStart = true;
  reset ();
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
  text("Level " + level, 500, 700);
  text("Time " + time, 500, 30);
}

void timeUp()
{
  if (time == 0)
  {
    gameStart = false;
    text("You Cut " + score + " blades of grass!", 50, 250);
    text("Time's Up", 250, 350);
    text("click to start level " + level,  120, 450);

    if (gameStart == false && keyPressed)
    {
      if (key == ' ')
      {
        reset();
      }
    }
  }
}


//void timer ()
//{
//  time = "60";
//  t = 1;
//  interval = 60;
//  t = interval-int(millis()/1000);
//  time = nf(t, 3);//convert int to string
//  text("Time " + time, 500, 30);
//  if(millis()> 60000)
//  {t=1;}
//}


void draw()
{    
  background(153, 153, 102);
  // stroke(51, 153, 51);

  summerFont = loadFont("KGSummerSunshineBlackout-48.vlw");
  textFont(summerFont);

  grass.update();
  grass.render();

  mower.update();
  mower.render();
  mower.update();
  mower.render();// slow if delete second set not sure why - 

  hitDetection ();

  gameText ();

  startScreen();

  timeUp ();

  if (gameStart)
  {
    time --;//game timer
  }

  //println();
}

void reset()
{
  setup();
  level +=1;
}

