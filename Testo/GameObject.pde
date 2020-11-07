class GameObject {
  protected float x;
  protected float y;
  protected float w;
  protected float h;
  protected int[] colors;
  protected Game game;
  protected Hitbox hitbox;
  
  public GameObject(float x, float y, float w, float h, int[] colors, Game game) {
    this.x = x;
    this.y = y;
    this.w = w;
    this.h = h;
    this.colors = colors;
    this.game = game;
    
    this.hitbox = new Hitbox(this.x, this.y, this.w, this.h, this.colors, this.game, this);
  }
  
  public void update(float dt) {
    hitbox.update(x, y, w, h, colors);
  }
}
