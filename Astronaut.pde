class Astronaut
{
  float x, y;
  int speedX = 10;
  int speedY = speedX;
  int health = 100;
  int imgIndex = 0;
  int passedTime = 0;
  int waitTime = 50;
  
  PImage[] astronautAnimL = new PImage[9];
  PImage[] astronautAnimR = new PImage[9];
  int startTime = millis();
  
  PImage astronautR = loadImage("astronautR.png"); 
  PImage astronautL = loadImage("astronautL.png");

  Astronaut(int x, int y)
  {
    this.x = x;
    this.y = y;
    for (int i = 0; i < astronautAnimL.length; i++)
    {
      astronautAnimL[i] = loadImage("astronautL"+i+".png"); 
    }
    for (int i = 0; i < astronautAnimR.length; i++)
    {
      astronautAnimR[i] = loadImage("astronautR"+i+".png"); 
    }
  }
  
  void display()
  {
   render();
   healthBar();
  }
  

  void render()
  {
    
    if (imgIndex >= astronautAnimL.length || imgIndex >= astronautAnimR.length)
    {
     imgIndex = 0; 
    }
    
    if (speedX >= 0)
    {
      image(astronautAnimR[imgIndex],x,y);
    }
    else
    {
      image(astronautAnimL[imgIndex],x,y);
    }
    
    passedTime = millis()-startTime;
    

    if (passedTime > waitTime) {
    imgIndex++;
    startTime = millis();
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
      
      if (keyCode == DOWN && y<height-50)
      {
        if(speedY < 0)
        {
         speedY = -speedY; 
        }
        y = y + speedY;
      }
      
      if (keyCode == UP && y>50)
      {
        if(speedY > 0)
        {
         speedY = -speedY; 
        }
        y = y + speedY;
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
