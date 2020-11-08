class Hitbox {
  private float x;
  private float y;
  private float w;
  private float h;
  private int[] colors;
  private Game game;
  private GameObject parent;
  
  public Hitbox(float x, float y, float w, float h, int[] colors, Game game, GameObject parent) {
    this.game = game;
    this.x = x;
    this.y = y;
    this.w = w;
    this.h = h;
    this.colors = colors;
    this.parent = parent;
    
    this.game.addHitbox(this);
  }
  
  public Object getParent() {
    return parent;
  }
  
  public float getX() {
    return x;
  }
  public float getY() {
    return y;
  }
  public float getWidth() {
    return w;
  }
  public float getHeight() {
    return h;
  }
  
  public void draw() {
    fill(colors[0], colors[1], colors[2]);
    rect(x, y, w, h);
    if (parent instanceof Platform) {
      ((Platform) parent).drawPlatform();
    } if (parent instanceof Player) {
      ((Player) parent).draw();
    }
  }
  
  public void update(float x, float y, float w, float h, int[] colors) {
    this.x = x;
    this.y = y;
    this.w = w;
    this.h = h;
    this.colors = colors;
  }
}
