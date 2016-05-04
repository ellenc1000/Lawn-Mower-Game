class Cut extends GameObject
{
  
Cut(float x, float y, float theta)
  {
    super(x,y);
    this.theta = theta;
  }
  
  void update()
  {
    forward.x = sin(theta);
    forward.y = -cos(theta);
  }
  
  void render()
  {
    pushMatrix();
    translate(pos.x, pos.y);
    rotate(theta);
    noStroke();
    fill(20,255,103);
    ellipse(0, -5, 25, 25);
    popMatrix();     
  }
}
