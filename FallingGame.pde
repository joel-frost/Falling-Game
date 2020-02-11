Astronaut astronaut, splashAstronaut;
Asteroid splashAsteroid;
HealthPickup splashHealthPickup;
ArrayList<Obstacle> obstacles;


PImage background;
int bgY, bgSpeed, maxObstacles, score, scoreOffset, highScore;
int gamemode;

/*
------------
Game Modes:
-2 = Reset
-1 = Death Screen
0 = Splash Screen
1 = Play game

------------
*/

void setup()
{
  size(600, 800);
  reset();
  highScore = 0;
  gamemode = 0;


  background = loadImage("background.png");
  
}

void scrollBackground() 
{
  
  image(background, 0, bgY); //draw background twice adjacent
  image(background, 0, bgY+background.height);
  bgY-=bgSpeed;
  if (bgY == -background.height)
  {
    bgY=0; //wrap background
  }
}

void draw()
{
  if (gamemode == 0)
  {
   splashScreen(); 
  }
  if (gamemode == 1)
  {
    scrollBackground();
    fill (255);
    
    if(frameCount % 5 == 0)
      {
         score += scoreOffset;
      }
      
    textSize(15);
    text("Score: " + score, 30, 40);
  
    astronaut.display();
  
    for (int i = 0; i < obstacles.size(); i++)
    {
      Obstacle o = obstacles.get(i);
  
      o.display();
  
      if (astronaut.collideDetect(o))
      {
        o.collide(astronaut);
      }
  
      if (o.isDead())
      {
        obstacles.remove(i);
        addObstacle();
      }
    }
  
    if (astronaut.isDead())
    {
      gamemode = -1;
    }
  }

  if (gamemode == -1)
  {
    deathScreen();
  }
  if (gamemode == -2)
  {
    reset();
  }
}

void keyPressed()
{
  astronaut.move();
  if (gamemode == -1)
  {
    if (key == 'r' || key == 'R') 
    {
      gamemode = -2;
    }
  }
  
  if (gamemode == 0)
  {
    if (key == ' ')
    {
     gamemode = 1; 
    }
  }
}

void addObstacle()
/*
Spawns obstacles based on probability. 
10% chance of health, 10% chance of diagonally moving asteroid. 
If neither spawn, spawn either 1 new normal asteroid (85%) or 2 new normal asteroids (15%).
Causes difficulty to increase over time.

Only spawns new obstacles if size of arraylist is below set variable. Can change difficulty using this.
*/

{
  if (obstacles.size() < maxObstacles)
  {

    float pickUpChance = random(1);
    float diagAsteroidChance = random(1);
    if (pickUpChance<0.1)
    {
      obstacles.add(new HealthPickup());
    } 
    else if (diagAsteroidChance<0.1)
    {
      obstacles.add(new DiagAsteroid());
    }    
    else
    {
      float extraAsteroidChance = random(1);
      int asteroidCounter = 1;
      if (extraAsteroidChance < 0.15)
      {
        asteroidCounter = 2;
      }
      for (int i = 0; i < asteroidCounter; i++)
      {
        obstacles.add(new Asteroid());
      }
    }
  }
}

void deathScreen()
{
  calcHighScore();
  fill(0);
  rect(0,0,width,height);
  fill(255);
  textAlign(CENTER);
  text("Score: "+score,width/2,200);
  text("High Score: "+highScore,width/2,300);
  text("Press R to Retry",width/2,600);
  textAlign(LEFT);

}

void calcHighScore()
{
 if (score > highScore)
  {
    highScore = score;
  } 
}

  

void reset()
{
  bgY=0;
  bgSpeed = 4;
  maxObstacles = 7;
  score = 0;
  scoreOffset = 1;
  astronaut = new Astronaut(200, 200);

  obstacles = new ArrayList<Obstacle>();
  for (int i = 0; i<3; i++)
  {
    obstacles.add(new Asteroid());
  }
  gamemode = 1;
  
}

void splashScreen()
{
  splashAstronaut = new Astronaut(290,200);
  splashAsteroid = new Asteroid(290,375);
  splashHealthPickup = new HealthPickup(290,575);
   
  fill(0);
  rect(0,0,width,height);
  fill(255);
  textAlign(CENTER);
  textSize(20);
  text("Space Falling Game",width/2,100);
  textSize(12);
  text("Joel Frost - 19010793",width/2,150);
  textSize(16);
  text("Avoid Asteroids! They'll make you lose fuel!",width/2,350);
  text("Collect Jetpack Fuel to refill the bar",width/2,550);
  fill(0,255,0);
  text("Press Space to Start",width/2,700);
  textAlign(LEFT);
  splashAstronaut.render();
  splashAsteroid.renderNoAnim();
  splashHealthPickup.render();
  
}
