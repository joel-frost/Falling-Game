class Obstacle
{
  float x, y, speedY;
  PImage sprite;
  float spriteSize;

  Obstacle()
  {
    speedY = random(3,6);
    x = random(20,width-30);
    y = random(height+50,height+150);
  }

  void render()
  {

    image(sprite, x, y); 
  }

  void move()
  {
    y = y-speedY;
  }
  
  void display()
  {
   render();
   move();
  }
  
  boolean isDead()
  {
   if (y < -60)
   {
    return true; 
   }
   return false;
  }
  
  void collide (Astronaut astronaut)
  {
    textSize(32);
    text("word", 10, 30); 
  }
  
  
  
}
