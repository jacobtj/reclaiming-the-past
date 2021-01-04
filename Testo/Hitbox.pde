class Hitbox {
  private float x;
  private float y;
  private float w;
  private float h;
  private int[] colors;
  private Game game;
  private GameObject parent;
  boolean invisible = false;
  private boolean is_active = true;
  
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
  
  public GameObject getParent() {
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
  public boolean getInvisible() {
    return invisible;
  }
  public void setInvisible(boolean b) { 
    invisible = b;
  } 
  public void setActive(boolean active) {
    this.is_active = active;
  }
  public boolean isActive() {
   return is_active; 
  }
  
  public void draw() {
    fill(colors[0], colors[1], colors[2]);
    
    if (!(parent instanceof Key)) {
      rect(x, y, w, h);
    }
    if (parent instanceof Platform) {
      ((Platform) parent).drawPlatform(x, y, w, h);
    } if (parent instanceof Player) {
      ((Player) parent).draw(x, y, w, h);
    } if (parent instanceof Key) {
      ((Key) parent).draw(x, y, w, h);
    } if (parent instanceof Door) {
      ((Door) parent).draw(x, y, w, h);
    } 
    
  }
  
  public void update(float x, float y, float w, float h, int[] colors) {
    this.x = x;
    this.y = y;
    this.w = w;
    this.h = h;
    this.colors = colors;
  }
  public void update(float x, float y, float w, float h) {
    this.x = x;
    this.y = y;
    this.w = w;
    this.h = h;
  }
}
