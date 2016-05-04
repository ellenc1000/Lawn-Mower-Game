
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

  cloud = new Cloud (random(50, 600), 650);

  rock1 = new Rock (rockX, rockY);

  for (int i = 0; i < levelRocks; i ++)
  {
    Rock rock = new Rock( random(100, width - 100), random(100, height - 100));
    rocks.add(rock);
  }

  minim = new Minim(this);

  mowerSound = minim.loadFile("mower.mp3");
  gameMusic = minim.loadFile("game music.mp3");
}

import ddf.minim.spi.*;
import ddf.minim.signals.*;
import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.ugens.*;
import ddf.minim.effects.*;

AudioPlayer mowerSound;
AudioPlayer gameMusic;

Minim minim;

//void stop()
//{
//  mowerSound.close();
//}

//AudioSnippet mowerSound;

ArrayList<Rock> rocks = new ArrayList<Rock>();

Player mower;
Grass grass;
Fuelcan can;
Fuelcan can2;
Cloud cloud;
Rock rock1;
Rock rock2;
Rock rock3;

PFont summerFont;

boolean startScreen = true; 
boolean gameStart;
int level = 0;
boolean clickLevel = false;
float levelRocks = 1;
int fuel = 1; 
int fullFuel = 10000;
boolean gotFuel = false;
int hit;
int score;

float canPosX;
float canPosY;
float rockX = random(50, 550);
float rockY = random(50, 550);

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
    text("Lawn Mower", 25, 200);
    textSize(30);
    text("Mow each neighbour's lawn", 40, 350);
    text("before you run out of fuel!", 30, 400);
    text("watch out for rocks!", 100, 450);
    text("use the Arrow keys to Mow", 35, 550);
    text("click to begin", 170, 650);
    //final String username = showInputDialog("Who is playing?");
    //saveStrings("scores.txt", username);
  }
}

void mouseClicked()
{
  startScreen = false;

  if (gameStart == false)
  {
    reset();
    gameStart = true;
  }
}

void music ()
{
  gameMusic.loop();
  gameMusic.rewind();

  mowerSound.loop();
  mowerSound.rewind();
  
  println("music play");
}

void hitDetection ()
{
  int row = (int) (mower.pos.y / grass.cellHeight);
  int col = (int) (mower.pos.x / grass.cellWidth);
  if (grass.grid[row][col])
  {
    score ++;
  }
  grass.grid[row][col]= false; // collision
}

void cloudHit ()///////fix coverage size
{
  int row = (int) (cloud.pos.y / grass.cellHeight);
  int col = (int) (cloud.pos.x / grass.cellWidth);
  grass.grid[row][col]= true; // collision
  grass.grid[row][col+1]= true; // collision
  grass.grid[row][col-1]= true; // collision
  grass.grid[row][col+2]= true; // collision
}

void gameText ()
{
  //score = hit;
  fill(0);
  text("Grass Cut " + score, 5, 35);
  text("Lawn " + level, 500, 700);
}

void fuelBar ()
{
  if ( fuel > 10000)//fuel never goes past bar total
  {
    fuel = 10000;
  }

  int fuelX = 555;
  int fuelY = 6;
  int fuelWidth = 130;
  int fuelHeight = 23;

  textSize(30); 
  fill(0);
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
    if (level <= 4)
    {
      text("click to start level " + nextLevel, 100, 450);
    }
    if (level == 5)
    {
      text("you mowed every lawn!", 85, 450);
      text("click to see how you did!", 80, 500);
    }
  }
}

void spawnCan ()
{
  if (level == 1 && fuel < 8000 && fuel > 3000 && gotFuel == false)// when can spawn
  {
    can.update();
    can.render();
  }

  if (level == 1 && fuel < 3000)
  {
    gotFuel = false;
    can2.update();
    can2.render();
  }

  //  if (level == 1 && fuel < 2000 && gotFuel == false)
  //  {
  //    can2.update();
  //    can2.render();
  //  }

  if (level == 2 && fuel < 7000 && fuel > 4000 && gotFuel == false)// when can spawn
  {
    can.update();
    can.render();
  }

  if (level == 2 && fuel < 2000)
  {
    gotFuel = false;
  }

  if (level == 2 && fuel < 2000 && gotFuel == false)
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
    fuel += 1000;
    gotFuel = true;
    can.pos.y = -10;
  }

  if (PVector.dist(can2.pos, mower.pos) < mower.halfW)
  {
    fuel += 1000;
    gotFuel = true;
  }
}

void gameEnd ()
{
  if (level == 6)
  {
    gameStart = false;
    rectMode(CENTER);
    fill(0, 153, 51);
    rect(350, 350, 700, 700);
    fill (0);
    textSize(75);
    text("All done", 95, 200);
    textSize(30);
    text("Lets see what your", 120, 300);
    text("neighbours thought", 110, 350);
    text("you got a grade of...", 115, 450);

    if ( score < 1000)
    {
      text("F", 400, 500);
      text("How?!?...", 190, 600);
    }
    if ( score > 1000 && score < 3000)
    {
      text("E", 400, 500);
      text("try again", 190, 600);
    }
    if ( score > 3000 && score < 5000)
    {
      text("D", 400, 500);
      text("I think you need to work", 180, 600);
      text("on your mowing skills", 180, 600);
    }
    if ( score > 5000 && score < 7000)
    {
      text("C", 400, 500);
      text("Not Bad", 180, 600);
    }
    if ( score > 7000 && score < 8000 )
    {
      text("B", 400, 500);
      text("Well done!!", 180, 600);
    }
    if ( score > 8000)
    {
      text("A", 400, 500);
      text("Your the real MVM!", 180, 600);
    }
  }
}

//void updateHighscore() {
//  scoreTable = scoreTable + score + " " + username;
//  String[] list = split(scoreTable, '_');
//  saveStrings("Highscore.txt", list);
//}

void rocks ()
{
  if (level ==1)
  {
    levelRocks = 2;
    for (int i = rocks.size () - 1; i >= 0; i --)
    {
      Rock rock = rocks.get(i);
      rock.update();
      rock.render();
      if (PVector.dist(rock.pos, mower.pos) < mower.halfW)
      {
        fuel -= 100;
      }
    }
  }

  if (level ==2)
  {
    levelRocks = 5;
    for (int i = rocks.size () - 1; i >= 0; i --)
    {
      Rock rock = rocks.get(i);
      rock.update();
      rock.render();
      if (PVector.dist(rock.pos, mower.pos) < mower.halfW)
      {
        fuel -= 100;
      }
    }
  }

  if (level ==3)
  {
    levelRocks = 7;
    for (int i = rocks.size () - 1; i >= 0; i --)
    {
      Rock rock = rocks.get(i);
      rock.update();
      rock.render();
      if (PVector.dist(rock.pos, mower.pos) < mower.halfW)
      {
        fuel -= 100;
      }
    }
  }

  if (level ==4)
  {
    levelRocks = 9;
    for (int i = rocks.size () - 1; i >= 0; i --)
    {
      Rock rock = rocks.get(i);
      rock.update();
      rock.render();
      if (PVector.dist(rock.pos, mower.pos) < mower.halfW)
      {
        fuel -= 100;
      }
    }
  }

  if (level ==5)
  {
    levelRocks = 11;
    for (int i = rocks.size () - 1; i >= 0; i --)
    {
      Rock rock = rocks.get(i);
      rock.update();
      rock.render();
      if (PVector.dist(rock.pos, mower.pos) < mower.halfW)
      {
        fuel -= 100;
      }
    }
  }
}

void clouds ()

{

  if (hit > 100 && cloud.pos.y > 20)
  {
    cloud.update();
    cloud.render();
  }
  if (cloud.pos.y < 20)
  {
    cloud.pos.y = 650;
  }
}

//import static javax.swing.JOptionPane.*;


void draw()
{ 
  rectMode(CENTER);
  background(153, 153, 102);

  summerFont = loadFont("KGSummerSunshineBlackout-48.vlw");
  textFont(summerFont);

if(gameStart == true)
{
  music ();
}

  grass.update();
  grass.render();

  spawnCan (); 

  rocks ();

  mower.update();
  mower.render();
  mower.update();
  mower.render();// slow if delete second set not sure why -

  clouds ();

  hitDetection ();

  cloudHit();

  fuelBar ();
  gameText ();

  startScreen();

  levelEnd();

  gameEnd();

  if (fuel <= 0)
  {
    fuel = 0;
  }

  println(gameStart);
}

void reset()
{
  if (level < 6)
  {
    setup();
    level +=1;
    fuel = fullFuel;
    gotFuel = false;
  }
}

