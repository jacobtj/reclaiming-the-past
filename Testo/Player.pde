class Player {
  private float x;
  private float y;
  private float w = 20.0;
  private float h = 50.0;
  private int[] colors = new int[] {0, 255, 0};
  private float speed = 200.0;
  private Hitbox hitbox;
  private Game game;
  
  public Player(float x, float y, Game game) {
    this.game = game;
    this.x = x;
    this.y = y;
    this.hitbox = new Hitbox(this.x, this.y, 20.0, 50.0, colors, game);
  }
  
  void update(float dt) {
    
    if (isKeyDown('w')) {
      y -= speed * dt;
    }
    if (isKeyDown('s')) {
      y += speed * dt;
    }
    if (isKeyDown('a')) {
      x -= speed * dt;
    }
    if (isKeyDown('d')) {
      x += speed * dt;
    }
    
    hitbox.update(x, y, w, h, colors);
    
  }
  
}
