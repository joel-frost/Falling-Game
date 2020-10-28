class HealthPickup extends Obstacle
{
 HealthPickup()
 {
   sprite = loadImage("healthup.png");
 }
 
 HealthPickup(int x, int y)
 {
  this.x = x;
  this.y = y;
  sprite = loadImage("healthup.png");
 }
 
 void collide(Astronaut astronaut)
  {
    if (astronaut.health < 70)
    {
      astronaut.health += 30;
    }
    else 
    {
      astronaut.health = 100;
    }
    
    y = -99;
  }
 
}
