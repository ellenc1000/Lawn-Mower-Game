class GameObject 
{
  PVector pos;
  PVector forward;
  float theta = 0.0f;
  float w;
  float halfW;
  float speed = 5.0f;
  color c; 
  PVector velocity;

  GameObject(float x, float y)
  {
    pos = new PVector(x, y);
    theta = 0;
    forward = new PVector(0, -1);
    w = 50.0f;
    halfW = w / 2;
  }
  
  void update()
  {
  }
  
  void render()
  {
  }
  
  void grassUpdate()
  {
  }
}
