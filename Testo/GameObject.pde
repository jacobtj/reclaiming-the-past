class GameObject {
  protected float x;
  protected float y;
  protected float w;
  protected float h;
  protected int[] colors;
  protected Game game;
  protected Hitbox hitbox;
  protected ArrayList<PImage> image;
  
  public GameObject(float x, float y, float w, float h, int[] colors, Game game, ArrayList<String> img) {
    this.image = new ArrayList<PImage>();
    this.x = x;
    this.y = y;
    this.w = w;
    this.h = h;
    this.colors = colors;
    this.game = game;
    for (String image : img) {
      this.image.add(loadImage(image));
    }
    
    if (! (this instanceof Background)) {
      this.hitbox = new Hitbox(this.x, this.y, this.w, this.h, this.colors, this.game, this);
    }
    
    this.game.addObject(this);
  }
  
  public void update(float dt) {
    hitbox.update(x, y, w, h, colors);
  }
  
  public float getX() {
    return x;
  }
  public void setX(float x) {
    this.x = x;
  }
  public float getY() {
    return y;
  }
  public void setY(float y) {
    this.y = y;
  }
  public float getWidth() {
    return w;
  }
  public void setWidth(float w) {
    this.w = w;
  }
  public float getHeight() {
    return h;
  }
  public void setHeight(float h) {
    this.h = h;
  }
  public int[] getColor() {
    return colors;
  }
  public Hitbox getHitbox() {
    return hitbox;
  }
}
