class Asteroid extends Obstacle
{ 
  int spriteSize;
  PImage[] asteroidsAnim = new PImage[8];
  int startTime = millis();
  int passedTime = 0;
  int waitTime = 200;
  int imgIndex = 0; 
  
  
  Asteroid()
  {
    spriteSize = int(random(30, 56));
    for (int i = 0; i < asteroidsAnim.length; i++)
    {
      asteroidsAnim[i] = loadImage("asteroid"+i+".png"); 
      asteroidsAnim[i].resize(spriteSize,spriteSize);
    }
    
  }
  
  Asteroid(int x, int y)
  {
    this.x = x;
    this.y = y;
    spriteSize = 50;
    for (int i = 0; i < asteroidsAnim.length; i++)
    {
      asteroidsAnim[i] = loadImage("asteroid"+i+".png"); 
      asteroidsAnim[i].resize(spriteSize,spriteSize);
    }
    
  }
  

  
  void render()
  {    
    if (imgIndex >= asteroidsAnim.length)
    {
     imgIndex = 0; 
    }
            
    image(asteroidsAnim[imgIndex],x,y); 
    
    passedTime = millis()-startTime;
    

    if (passedTime > waitTime) {
    imgIndex++;
    startTime = millis();
    }
  }
  
  void renderNoAnim()
  {
    image(asteroidsAnim[0],x,y);
  }
  
  
  void collide(Astronaut astronaut)
  {
    if (astronaut.health>=40)
    {
      astronaut.health -= 40;
    }
    else
    {
     astronaut.health = 0; 
    }
    y = -99;
  }
  
  
  
}
