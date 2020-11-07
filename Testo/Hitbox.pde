class Hitbox {
  private float x;
  private float y;
  private float w;
  private float h;
  private int[] colors;
  private Game game;
  
  public Hitbox(float x, float y, float w, float h, int[] colors, Game game) {
    this.game = game;
    this.x = x;
    this.y = y;
    this.w = w;
    this.h = h;
    this.colors = colors;
    
    this.game.addHitbox(this);
  }
  
  
  
  public double getX() {
    return x;
  }
  public double getY() {
    return y;
  }
  public double getWidth() {
    return w;
  }
  public double getHeight() {
    return h;
  }
  
  public void draw() {
    fill(colors[0], colors[1], colors[2]);
    rect(x, y, w, h);
  }
  
  public void update(float x, float y, float w, float h, int[] colors) {
    this.x = x;
    this.y = y;
    this.w = w;
    this.h = h;
    this.colors = colors;
  }
}
