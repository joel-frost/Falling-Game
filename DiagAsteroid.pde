class DiagAsteroid extends Asteroid
{
  float speedX = super.speedY;
  DiagAsteroid()
  {
  }
  
  void move()
  {
    y = y-speedY;
    x = x+speedX;
    
    if (x>=width-20 || x<=20)
    {
      speedX = -speedX;  
    }
  }

}
