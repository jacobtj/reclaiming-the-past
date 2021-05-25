abstract class GameObject {
  protected float x;
  protected float y;
  protected float w;
  protected float h;
  protected int[] colors;
  protected Game game;
  protected Hitbox[] hitbox = new Hitbox[2];
  protected ArrayList<PImage> image;
  private float offset1 = 0;
  private float offset2 = 0;
  
  public GameObject(float x, float y, float w, float h, int[] colors, Game game, ArrayList<PImage> img) {
    this.image = new ArrayList<PImage>();
    this.x = x;
    this.y = y;
    this.w = w;
    this.h = h;
    this.colors = colors;
    this.game = game;
    
    if (img != null) { 
      for (PImage image : img) {
        this.image.add(image);
      }
    }
    
    if (game != null) {
      if (! (this instanceof Background)) {
        this.hitbox[0] = new Hitbox(this.x, this.y, this.w, this.h, this.colors, this.game, this);
        //if (!(this instanceof Player)) {
          this.hitbox[1] = new Hitbox(this.x + this.game.getLevelSize(), this.y, this.w, this.h, this.colors, this.game, this);
        //}
      }
    }
    if (this.game != null) {
      this.game.addObject(this);
    }
  }
  
  public void setOffset1(float offset) {
    this.offset1 = offset;
  }
  public float getOffset1() {
    return offset1;
  }
  public void setOffset2(float offset) {
    this.offset2 = offset;
  }
  public float getOffset2() {
    return offset2;
  }
  public void setActive(boolean active) {
    for (int i = 0; i < hitbox.length; i += 1) {
      hitbox[i].setActive(active);
    }
  }
  public void setInvisible(boolean invisible) {
    for (int i = 0; i < hitbox.length; i += 1) {
      hitbox[i].setInvisible(invisible);
    }
  }
  
  public void update(float dt) {
    if (game != null) {
    if (hitbox[0] != null) {
      hitbox[0].update(x + offset1, y, w, h, colors);
    }
   // if (!(this instanceof Player)) {
     if (hitbox[1] != null) {
       
      hitbox[1].update(x + this.game.getLevelSize() + offset2, y, w, h, colors);
     }
   }
   // }
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
  public Hitbox[] getHitbox() {
    return hitbox;
  }
  public abstract void draw(float x, float y, float w, float h);
}
