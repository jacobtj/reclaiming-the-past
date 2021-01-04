class Moving_Platform extends Platform {

  
  private float speed = 200.0;
  //platform moves in a direction (0-7), 0 being north, 1 being north east, ... etc,  
  private int direction = 0;
  //# of calls to update before the platform turns around, 0 is default and signifies no turnback
  private float turnback = 0;
  private int timesteps = 0;

  private Game game;
  
  public Moving_Platform(float x, float y, float w, float h, int direction, float turnback, Game game) {
    super(x,y,w,h, game);
    this.direction = direction;
    this.turnback = turnback;
  }
  
  //override
  void update(float dt) {
    timesteps += 1;
    if (turnback != 0 && timesteps == turnback) {
      speed = -speed;
      timesteps = 0;
    }
    if (direction == 0) {
      y += speed * dt;
      System.out.println("moving");
    }
    if (direction == 1) {
      y += 0.5 * speed * dt;
      x += 0.5 * speed * dt;
    }
    if (direction == 2) {
      x += speed * dt;
    }
    if (direction == 3) {
      x += speed * dt;
      y -= 0.5 * speed * dt;
    }
    if (direction == 4) {
      y -= speed * dt;
    }
    if (direction == 5) {
      y -= 0.5 * speed * dt;
      x -= 0.5 * speed * dt;
    }
    if (direction == 6) {
      x -= speed * dt;
    }
    if (direction == 7) {
      x -= 0.5 * speed * dt;
      y += 0.5 * speed * dt;
    }
    super.update(dt);
  }
  
  public String toString() {
    return "Moving_Platform";
  }
  
}
