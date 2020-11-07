class Moving_Platform extends Platform {

  
  private float x;
  private float y;
  private float w = 80.0;
  private float h = 10.0;
  private int[] colors = new int[] {0, 0, 255};
  private float speed = 200.0;
  //platform moves in a direction (0-7), 0 being north, 1 being north east, ... etc,  
  private int direction = 0;

  private Hitbox hitbox;
  private Game game;
  
  public Moving_Platform(float x, float y, int direction, Game game) {
    super(x,y,game);
    this.direction = direction;
    this.hitbox = new Hitbox(this.x, this.y, w, h, colors, game);
  }
  
  //override
  void update(float dt) {
    if (direction == 0) {
      y += speed * dt;
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
    hitbox.update(x, y, w, h, colors);
  }
  
}
