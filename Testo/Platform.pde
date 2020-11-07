class Platform {
  private float x;
  private float y;
  private float w = 80.0;
  private float h = 10.0;
  private int[] colors = new int[] {0, 0, 255};

  private Hitbox hitbox;
  private Game game;
  
  public Platform(float x, float y, Game game) {
    this.game = game;
    this.x = x;
    this.y = y;
    this.hitbox = new Hitbox(this.x, this.y, w, h, colors, game);
  }
  
  //update the position of the platform over time (but only implemented for moving platform...)
  void update(float dt) {
  }
  
}
