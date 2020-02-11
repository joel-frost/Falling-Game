class Astronaut
{
  int x, y, speedY;
  int speedX = 7;
  int health = 100;
  PImage astronautR = loadImage("astronautR.png"); 
  PImage astronautL = loadImage("astronautL.png");

  Astronaut(int x, int y)
  {
    this.x = x;
    this.y = y;
  }
  
  void display()
  {
   render();
   healthBar();
  }
  

  void render()
  {
    if (speedX >= 0)
    {
      image(astronautR, x, y);
    }
    else
    {
      image(astronautL, x, y);
    }
  }

  void move()
  {
    if (key == CODED) 
    {
      if (keyCode == LEFT && x>=10) 
      {
        if (speedX > 0)
        {
          speedX = -speedX;     
        }
        x += speedX;
        
      }
      if (keyCode == RIGHT && x<=width-30)
      {
        if (speedX < 0)
        {
         speedX = -speedX; 
        }
        x += speedX;
      }
    }
  }
  
  boolean collideDetect(Obstacle obstacle)
  {
    return (abs(this.x-obstacle.x) < 50 &&  abs(this.y-obstacle.y) < 50);
  }
  
  void healthBar()
  {
    //textSize(15);
    //text(health, width-70, 20); 
    fill(255,0,0);
    rect(width-130,30,100,10);
    fill(0,255,0);
    rect(width-130,30,health,10);
  }
  
  boolean isDead()
  {
   return (health<=0);
  }
  
}
