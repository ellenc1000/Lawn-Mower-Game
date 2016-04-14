class Cloud extends GameObject
{

  float theta; // amount by which player is rotated

  float w, halfW;

  Cloud (float x, float y)
  {
    super(x, y);
  }

  void update () // movement
  {
    
    forward.x = sin(theta);
    forward.y = -cos(theta);
    
  }
  
  int cloudCentre = -10;
  
  void render () //draw item
  {
   rectMode(CENTER);
   rect(cloudCentre, cloudcentre, 
  }

}
